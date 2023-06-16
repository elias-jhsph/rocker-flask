# rocker-flask
really specific Ubuntu docker with R by rocker and python 3.11 added with 
specific R packages and Python modules included

## m1 Install Instruction for R 4.1.1

- set up home brew https://diewland.medium.com/how-to-install-python-3-7-on-macbook-m1-87c5b0fcb3b5
- `ibrew install R`
- switch to bash terminal
- make .bash_profile look like this with nano
`export PATH="/usr/local/bin/:${PATH}"
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin"
export PATH="/opt/homebrew/bin:${PATH}"
alias ibrew="arch -x86_64 /usr/local/bin/brew"
alias pip3.7='python3.7 -m pip'
alias pip3.9='python3.9 -m pip'`
- Install java jdk https://www.oracle.com/java/technologies/javase-jdk16-downloads.html
- `R CMD javareconf`
- `ibrew install libgit2`
- `ibrew install v8`
- `ibrew install gsl`
- go to rocker-flask folder and run `Rscript --vanilla install2.R`
