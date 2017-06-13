FROM egob/simple:v1.6 

RUN apt-get install -y sendmail

RUN echo "define('SMART_HOST','smtp-rely.google.com')" >> /etc/mail/sendmail.mc
