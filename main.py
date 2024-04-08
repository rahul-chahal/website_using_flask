from flask import Flask, session, url_for, redirect
from flask import render_template, request
from flask_session import Session


from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.orm import DeclarativeBase
from sqlalchemy import Integer, String, create_engine, text
from sqlalchemy.orm import Mapped, mapped_column
import json
from flask_mail import Mail, Message


app=Flask(__name__)

class Base(DeclarativeBase):
  pass
db = SQLAlchemy(model_class=Base)

with open ('templates/config.json','r') as x:
    params = json.load(x)["config"]

app.config['SQLALCHEMY_DATABASE_URI'] = params["local_server"]

app.config.update(
MAIL_SERVER = params["mail_server"],
MAIL_PORT = params["mail_port"],
MAIL_USE_TLS = False,
MAIL_USE_SSL = True,
MAIL_USERNAME =  params["mail_id"],
MAIL_PASSWORD = params["mail_pwd"],
MAIL_DEFAULT_SENDER = params["mail_id"],
SECRET_KEY = params["SECRET_KEY"],
SESSION_TYPE = params["SESSION_TYPE"]

)


mail = Mail(app)


db = SQLAlchemy(model_class=Base)
db.init_app(app)
Session(app)

def show_database():

    engine = create_engine(app.config['SQLALCHEMY_DATABASE_URI'])

    # Establish a connection to the database
    connection = engine.connect()

    # Execute the SQL command to show databases
    result = connection.execute(text("SHOW DATABASES"))

    # Fetch and print the databases
    databases = [row[0] for row in result.fetchall()]
    print("Databases:")
    for database in databases:
        print(database)

    # Close the connection
    connection.close()
# show_database()

class Posts(db.Model):
    sno: Mapped[int] = mapped_column(primary_key=True)
    title: Mapped[str] = mapped_column(unique=True)
    subtitle: Mapped[str]
    content: Mapped[str]
    date: Mapped[str]

class Contacts(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str]
    email: Mapped[str]
    phone: Mapped[str]
    mssg: Mapped[str]

class Admin(db.Model):
    id: Mapped[int] = mapped_column(primary_key=True)
    username: Mapped[str]
    password: Mapped[str]


@app.route("/")
def home():
    posts = Posts.query.all()
    if not session.get("username"):
        return render_template("/sign-in.html")
    return render_template("index.html", params=params, posts=posts)

@app.route("/index")
def admin_panal():
    posts = Posts.query.all()
    return render_template("index.html", posts=posts, params=params)



@app.route("/dashboard", methods=['GET', 'POST'])
def signin():
    posts = Posts.query.all()
    if request.method == 'POST':
        username = request.form.get('email')
        password = request.form.get('password')
        admin = Admin.query.all()
        for i in admin:
            if i.username == username and i.password == password:
                session['user'] = username
                
                return render_template("admin_panal.html", posts=posts, params=params)
    
    
    return render_template("sign-in.html", error_message="Incorrect Credentials")

@app.route("/index")
def index():
    posts = Posts.query.filter().limit(params["no_of_post"]).all()
    return render_template("index.html", posts=posts, params=params)

@app.route("/about")
def rahul():
    val1=543
    return render_template('about.html', params=params)

@app.route("/post")
def PostPage():
    posts = Posts.query.all()
    
    return render_template("post.html", posts=posts , params=params)

# using slag
@app.route("/post/<int:sno>")
def show_post(sno):
    if sno:
        post = Posts.query.get_or_404(sno)
        return render_template("show_post.html", post=post, params=params)
    else:
        return "Post ID not provided."

# using get method    
@app.route("/show_post", methods=["GET"])
def show():
    sno = request.args.get('post_id')
    if sno:
        post = Posts.query.get_or_404(sno)
        return render_template("show_post.html", post=post, params=params)
    else:
        return "Post ID not provided."

@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        n = request.form.get('name')
        e = request.form.get('email')
        p = request.form.get('phone')
        m = request.form.get('mssg')
        entry= Contacts(name=n, email=e, phone=p, mssg=m)
        db.session.add(entry)
        db.session.commit()

        msg = Message( 
                f'Hello {n}, thanks for contacting Rahul\'s website. Your message has been successfully sent. Your message is: \\n {m}' , 
                sender =params["mail_id"], 
                recipients = [e] 
               ) 
        msg.body = str(msg)+ "\n" + str(p)
        mail.send(msg) 
    return render_template('contact.html', params=params)


@app.route("/edit_form", methods=["GET"])
def edit():
    sno = request.args.get('sno')
    return render_template('edit_form.html', params=params, s_no=sno)

@app.route("/delete_form", methods=["GET"])
def delete():
    sno = request.args.get('sno')
    post_to_delete = Posts.query.filter_by(sno=sno).first()
    db.session.delete(post_to_delete)
    db.session.commit()
    posts = Posts.query.all()
    return render_template("admin_panal.html", posts=posts)

@app.route("/update", methods=["POST"])
def update():
    sno= request.form.get('sno')
    t = request.form.get('title')
    st = request.form.get('subtitle')
    c = request.form.get('content')
    d = request.form.get('date')
    entry = Posts.query.filter_by(sno=sno).first()  
    if entry:
    # Update the attributes of the entry
        entry.title = t
        entry.subtitle = st
        entry.content = c
        entry.date = d
    
    # Commit the changes to the database
        db.session.commit()
        posts = Posts.query.all()
        return render_template("admin_panal.html", posts=posts)
    else:
        # Handle the case where no record is found with the given sno
        return f"No record found for the provided sno. {sno}"



app.run(debug=True)