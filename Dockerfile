FROM ubuntu:latest

EXPOSE 8000

RUN ls -lat && apt-get update && apt install sudo -y && sudo apt-get install python3.8 -y \
&& python3.8 --version && sudo apt install python3-pip -y && pip --version \
&& sudo apt install python3.8-venv 

CMD python3 -m venv env && . env/bin/activate && pip install -r requirements.txt && python manage.py migrate &&  python3 manage.py runserver 0.0.0.0:8000
