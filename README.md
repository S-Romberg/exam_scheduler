# Exam Scheduler API

### Steps to run tests
```
$ git clone <url>
$ cd app
$ bundle i
$ rake db:setup
$ rake
```

###  Request params:
```
{ 
first_name: String, 
last_name: String, 
phone_number: String, 
college_id: Integer, 
exam_id: Integer, 
start_time: DateTime
}
```

### Acceptance Criteria: 

#### A client can send the above request and expect the following behavior 

> A successful (200 OK) response if: 
> 
> - [x] the request data is valid and sanitized 
> 
> - [x] a college exists in the database (college_id) 
> 
> - [x] an exam exists and belongs to the college (exam_id) 
> 
> - [x] a user is successfully found or created, and assigned to the exam 
> 
> - [x] the start_time of the request falls within an Exam's time window 
> 
> A bad request (400) response with appropriate error message if: 
> 
> - [x] the request data is invalid or not clean 
> 
> - [x] a college with the given college_id is not found 
> 
> - [x] an exam with the given exam_id is not found or does not belong to the college 
> 
> - [x] a user fails to be found or created, or failed to get associated with the exam 
> 
> - [x] a requested start_time does not fall with in an exam's time window 
> - [x] Bonus - [ApiRequests are logged](app/controllers/application_controller.rb)
> 
> 
> Appropriate tests linked [here](spec/requests/users_spec.rb)
> 


Time to complete (not including breaks): ~3 hours

#### Next steps:
  - Allow for rescheduling and cancellation of exams
  - Flesh out remaining CRUD functionality on all tables
