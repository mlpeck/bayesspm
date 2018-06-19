This repository contains an unpublished manuscript describing my work on Bayesian modeling of galaxy star formation histories by full spectrum fitting. What's new here to the best of my knowledge (and I've done a fairly careful literature search) is that star formation histories are non-parametric, that is no functional form is imposed. This adds dozens or even hundreds of parameters to models, which has generally been thought to render them computationally intractable -- see for example [Cappellari 2017](https://ui.adsabs.harvard.edu/#abs/2017MNRAS.466..798C/abstract). The secret to tractability is in the sampler, and no that sampler isn't `emcee`. It turns out to be the variation of Hamiltonian Monte Carlo dubbed the No U-Turn Sampler (aka NUTS). The particular implementation I use is [Stan](http://mc-stan.org/), and Stan code as described in the paper is included in this repository.

The paper is a snapshot of where I was at in mid 2017. I've continued to work on both the code and running models, with some thousands more model runs executed in the past year. While I could revise the paper to reflect the current state of my art I've decided to freeze "development" and leave it in its 2017 form, except for recently correcting a few typos and changing the working title. I am of course willing to consider collaborating on a paper intended for publication in a proper peer reviewed journal, but barring that I don't intend to keep working on this article. The Stan code has changed somewhat from that described in the paper; please email me if you would like the current version. I intend soon to produce properly version controlled code and create a separate Github repository, but that may take a while.

I have several short term goals for continuing this project:

1. Start a blog. This stuff is likely to be always work in progress, so I may as well keep a journal of it. I also have other related projects underway that I can write about.
1. Clean up my existing code. I do considerable pre and post processing in [R](https://www.r-project.org/), which makes the Stan code by itself not so useful. Ideally the full code capable of creating reproducible outputs should be available.
1. Translate the code to Python. The computational routines aren't too hard to translate and work is underway. Stan has full featured interfaces to both R and Python. Some of my visualization tools are R specific though, which might be a problem. 

Longer term:

1. Cappellari's Python version of `ppxf` should be suitable for providing data inputs to the Stan models, and if you're an astronomer you should probably be using it. I plan to figure out how to use it myself.
1. Although Stan is great there are alternatives. The one other reasonably mature implementation of the NUTS algorithm that I'm aware of is [`pymc3`](http://docs.pymc.io/), which of course is a Python module. I've seen very few performance comparisons with Stan, so at this point all I can say is it might be worth trying out. No, I don't consider `emcee` a viable alternative.

Michael Peck
mlpeck54@gmail.com
mlpeck54@earthlink.net

June 2018

