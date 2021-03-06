% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/retrieve-credential.R
\name{retrieve_credential}
\alias{retrieve_credential}
\alias{retrieve_credential_local}
\alias{retrieve_credential_mssql}
\title{Read a token and other credentials from a (non-REDCap) database or file.}
\usage{
retrieve_credential_local(
  path_credential, project_id, check_url=TRUE,
  check_username=FALSE, check_token_pattern=TRUE
)
retrieve_credential_mssql(
  project_id, instance, dsn, channel=NULL
)
}
\arguments{
\item{path_credential}{The file path to the CSV containing the credentials. Required.}

\item{project_id}{The ID assigned to the project withing REDCap.  This allows the user to store tokens to multiple REDCap projects in one file.  Required}

\item{check_url}{A \code{logical} value indicates if the url in the credential file should be checked to have approximately the correct form.  Defaults to TRUE.}

\item{check_username}{A \code{logical} value indicates if the username in the credential file should be checked against the username returned by R.  Defaults to FALSE.}

\item{check_token_pattern}{A \code{logical} value indicates if the token in the credential file is a 32-character hexadecimal string.  Defaults to FALSE.}

\item{instance}{The casual name associated with the REDCap instance on campus.  This allows one credential system to accommodate multiple instances on campus.  Required}

\item{dsn}{A \href{http://en.wikipedia.org/wiki/Data_source_name}{DSN} on the local machine that points to the desired MSSQL database. Required.}

\item{channel}{An \emph{optional} connection handle as returned by \code{\link[RODBC:odbcConnect]{RODBC::odbcConnect()}}.  See Details below. Optional.}
}
\value{
A list of the following elements
\itemize{
\item \code{redcap_uri}: The URI of the REDCap Server.
\item \code{username}: Username.
\item \code{project_id}: The ID assigned to the project withing REDCap.
\item \code{token}: The token to pass to the REDCap server
\item \code{comment}: An optional string.
}
}
\description{
These functions are not essential to calling the REDCap API, but instead are functions that help manage tokens securely.
}
\details{
If the database elements are created with the script provided in package's 'Security Database' vignette, the default values will work.
}
\note{
Although we strongly encourage storing all the tokens on a central server (\emph{e.g.}, see the
\code{retrieve_credential_mssql()} function and the "SecurityDatabase" vignette), there are times
when this approach is not feasible and the token must be stored locally.  Please contact us
if your institution is using something other than SQL Server, and
would like help adapting this approach to your infrastructure.
}
\examples{
library(REDCapR) #Load the package into the current R session.
# ---- Local File Example ----------------------------
path <- system.file("misc/example.credentials", package="REDCapR")
(p1  <- retrieve_credential_local(path, 153L))
(p2  <- retrieve_credential_local(path, 212L))
}
\author{
Will Beasley
}
