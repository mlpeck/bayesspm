// calzetti attenuation
// precomputed emission lines
// no standard deviation fudge

functions {
    vector calzetti(vector lambda, int nl, real tauv) {
        real k;
        real ls;
        vector[nl] fk;
        
        // below expression obtained by refitting polynomial to published relation
        
        for (i in 1:nl) {
            ls = lambda[i]/10000.;
            k = -0.2688+0.7958/ls-4.785e-2/(ls^2)-6.033e-3/(ls^3)+7.163e-04/(ls^4);
            fk[i] = exp(-k*tauv);
        }
        return fk;
    }
}
data {
    int<lower=1> nt;  //number of stellar ages
    int<lower=1> nz;  //number of metallicity bins
    int<lower=1> nl;  //number of data points
    int<lower=1> n_em; //number of emission lines
    real<lower=0> ub;
    vector[nl] lambda;
    vector[nl] gflux;
    vector[nl] g_std;
    matrix[nl, nt*nz] sp_st; //the stellar library
    matrix[nl, n_em] sp_em; //emission line profiles
}
parameters {
    vector<lower=0, upper=1>[nt*nz] b_st;
    vector<lower=0>[n_em] b_em;
    real<lower=0, upper=ub> tauv;
}
model {
    b_em ~ normal(0, 1);
    gflux ~ normal((sp_st*b_st) .* calzetti(lambda, nl, tauv) 
                    + sp_em*b_em, g_std);
}

// put in for posterior predictive checking and log_lik

generated quantities {
    vector[nl] gflux_rep;
    vector[nl] mu_g;
    vector[nl] log_lik;
    
    mu_g = (sp_st*b_st) .* calzetti(lambda, nl, tauv) + sp_em*b_em;
    
    for (i in 1:nl) {
        gflux_rep[i] = normal_rng(mu_g[i] , g_std[i]);
        log_lik[i] = normal_lpdf(gflux[i] | mu_g[i], g_std[i]);
        
    }
}

