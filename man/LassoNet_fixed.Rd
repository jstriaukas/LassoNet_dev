\name{lasso.net.fixed}
\alias{lasso.net.fixed}
\title{
Estimates coefficients over the grid values of penalty parameters.}
\description{
See lasso.net.grid
}
\usage{lasso.net.fixed(x,y,beta.0,lambda1,lambda2,M1,n.iter,iscpp,tol)}
\arguments{
\item{x}{\eqn{n \times p} input data matrix}
\item{y}{response vector or size \eqn{n \times 1}}
\item{beta.0}{initial value for \eqn{\beta}; default - zero vector of size \eqn{n \times 1}}
\item{lambda1}{lasso penalty coefficient}
\item{lambda2}{network penalty coefficient}
\item{M1}{penalty matrix}
\item{n.iter}{maximum number of iterations for \eqn{\beta} updating; default - 1e5}
\item{iscpp}{binary choice for using cpp function in coordinate updates; 1 - use C++ (default), 0 - use R.}
\item{tol}{convergence in \eqn{\beta} tolerance level; default - 1e-6}
}
\details{Function loops through the grid of values of penalty parameters \eqn{\lambda}1 and \eqn{\lambda}2 until convergence is reached. Warm starts are stored for each iterator. The warm starts are stored once the coordinate updating converges.}
\value{
\item{beta}{Matrix of \eqn{\beta} coefficients. Columns denote different \eqn{\lambda}1
coefficients, rows - \eqn{\lambda}2 coefficients}
\item{mse}{Mean squared error value}
\item{iterations}{matrix with stored number of steps for sign matrix to converge}
\item{update.steps}{matrix with stored number of steps for \eqn{\beta} updates to converge. (only stores the last values from connection signs iterations)}
\item{convergence.in.grid}{matrix with stored values for convergence in \eqn{\beta} coefficients. If at least one \eqn{\beta} did not converge in sign matrix iterations, 0 (false) is stored, otherwise 1 (true)}
}
\author{
Maintainer: Jonas Striaukas <jonas.striaukas@gmail.com>
}
\references{Weber, M., Striaukas, J., Schumacher, M., Binder, H. "Network-Constrained Covariate Coefficient and Connection Sign Estimation" (2018) <doi:10.2139/ssrn.3211163>}


\examples{
p=200
n=100
beta.0=array(1,c(p,1))
x=matrix(rnorm(n*p),n,p)
y=rnorm(n,mean=0,sd=1)
lambda1=c(0,1)
lambda2=c(0,1)
M1=diag(p)
lasso.net.fixed(x, y, beta.0, lambda1, lambda2, M1)
}
