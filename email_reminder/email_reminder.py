import os, smtplib, logging

GMAIL_USERNAME  = os.getenv("BG93_GMAIL_USERNAME")
GMAIL_PASSWORD  = os.getenv("BG93_GMAIL_PASSWORD")
GMAIL_RECIPIENT = os.getenv("KC_GMAIL_USERNAME")
EMAIL_MESSAGE   = "Update job centre situation"


logger          = logging.getLogger("Email Reminder App")
logger.setLevel(logging.INFO)
file_handler    = logging.FileHandler("/var/log/email_reminder.log")
formatter       = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')

file_handler.setFormatter(formatter)
logger.addHandler(file_handler)

def send_reminder():

    try:
        server = smtplib.SMTP_SSL("smtp.gmail.com", 465)
        server.ehlo()
    except Exception as e:
        logger.exception("Connection Error")

    try:
        server.login(GMAIL_USERNAME, GMAIL_PASSWORD)
    except smtplib.SMTPAuthenticationError as e:
        logger.error("Connection Error {}".format(e))
    else:
        server.sendmail(GMAIL_USERNAME, GMAIL_RECIPIENT, EMAIL_MESSAGE)
        server.close()
        logger.info("EMAIL SENT !")

if __name__ == "__main__":
    send_reminder()
