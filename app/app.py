from flask import Flask, render_template, request, redirect, jsonify
from models import db, Build

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///builds.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db.init_app(app)

with app.app_context():
    db.create_all()


@app.route('/')
def index():
    builds = Build.query.all()
    return render_template('index.html', builds=builds)


@app.route('/add', methods=['GET', 'POST'])
def add():
    if request.method == 'POST':
        name = request.form['name']
        description = request.form['description']
        
        new_build = Build(name=name, description=description)
        db.session.add(new_build)
        db.session.commit()
        
        return redirect('/')
    return render_template('add.html')


@app.route('/api/builds')
def api_builds():
    builds = Build.query.all()
    builds_list = [{"name": build.name, "description": build.description} for build in builds]
    return jsonify(builds_list)


if __name__ == '__main__':
    app.run(debug=True)