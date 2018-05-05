# pdflatex-lambda
AWS Lambda function handler for converting LaTeX documents into PDFs.

Drag a .tex file into an s3 bucket to compile it into a pdf.  

### Deployment
- create virtualenv and enter it
- `pip install zappa`
- Create two s3 buckets, one name xxxx and other xxxx-pdf
- Put arn of s3 bucket xxxx in zappa_settings.json under events
- `zappa deploy latex`

### Creating TeXLive Package
- Launch an Amazon Linux EC2 instance and ssh on to it
- `wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz`
- `tar -xvzf install-tl-...`
- `cd install-tl-...`
- `install-tl -gui text`
