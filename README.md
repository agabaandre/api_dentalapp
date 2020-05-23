# api_dentalapp Documentation

# API REQUESTS
1. login_post
http://localhost/api_dentalapp/Api/login/KEY
posted data

```javascript
{
  "username": "admin@admin.com",
  "password": "admin"
}
```
1. response
```javascript
{
  "msg": "USER_FOUND",
  "status": "Authenticated",
  "user": {
    "name": "Super l Administrator",
    "uuid": "2",
    "usertype": "admin"
  }
}
```
1. post a new request / consulation
1. automatically login in the user and give them their deault password login
1. Patient is a hardcoded user category predefined from the forms
http://localhost/api_dentalapp/Api/request/KEY
1. posted data
```javascript
{
  "name": "Kiyingi Chris",
  "mobile": "07877261881",
  "email": "chris@gmail.com",
  "clinic": " Kitezi HCIII",
  "doctor": "5",
  "address": "Kampala",
  "request_date": "2020-05-23",
  "requested_date": "2020-05-24",
  "services": "Tooth Removal, Whitening, Cementing",
  "remarks": "In Pain",
  "usertype": "Patient"
}
```
1. response
```javascript
{
  "error": "",
  "msg": "CREATED",
  "message": "Submitted",
  "userinfo": [
    {
      "uuid": "18",
      "username": "07877261881",
      "password": "d56b699830e77ba53855679cb1d252da",
      "apikey": null,
      "usertype": "Patient",
      "name": "Kiyingi Chris",
      "created_on": "2020-05-23 20:55:51",
      "status": "1"
    }
  ]
}
```
http://localhost/api_dentalapp/Api/requests/KEY
1. get last 20 requests for Admins
1. response
```javascript
{
  "msg": "Data Found",
  "requests": [
    {
      "id": "1",
      "name": "Nkuke Henry",
      "mobile": "0785677181",
      "email": "henricsanyu@gmail.com",
      "clinic": "ST. MARYS",
      "doctor": "1",
      "address": "KYEBANDO NSOBA",
      "request_date": "2020-05-23",
      "requested_date": "2020-05-25 03:08:43",
      "services": "Dental cleaning, Cementing",
      "remarks": "Thanks",
      "status": "0"
    },
    {
      "id": "2",
      "name": "Agaba Andrew",
      "mobile": "0702787688",
      "email": "agabaandre@gmail.com",
      "clinic": "St.Marys",
      "doctor": "4",
      "address": "Kampala",
      "request_date": "2020-05-22",
      "requested_date": "2020-05-30 05:35:07",
      "services": "Teeth Whitening",
      "remarks": "Call me to comfirm",
      "status": "0"
    },
    {
      "id": "3",
      "name": "Dembe Denis",
      "mobile": "07829928199",
      "email": null,
      "clinic": " Kitezi HCIII",
      "doctor": "3",
      "address": "Kampala",
      "request_date": "2020-05-23",
      "requested_date": "2020-05-29 00:00:00",
      "services": "Tooth Removal, Whitening, Cementing",
      "remarks": "Call Me",
      "status": "0"
    },
    {
      "id": "4",
      "name": "Dembe Denis",
      "mobile": "07829928199",
      "email": "dembe@gmail.com",
      "clinic": " Kitezi HCIII",
      "doctor": "3",
      "address": "Kampala",
      "request_date": "2020-05-23",
      "requested_date": "2020-05-29 00:00:00",
      "services": "Tooth Removal, Whitening, Cementing",
      "remarks": "Call Me",
      "status": "0"
    },
    {
      "id": "5",
      "name": "Luck Jim",
      "mobile": "07899928199",
      "email": "Jim@gmail.com",
      "clinic": " Kitezi HCIII",
      "doctor": "2",
      "address": "Kampala",
      "request_date": "2020-05-23",
      "requested_date": "2020-05-24 00:00:00",
      "services": "Tooth Removal, Whitening, Cementing",
      "remarks": "Call Me",
      "status": "0"
    },
    {
      "id": "6",
      "name": "Luck Jim",
      "mobile": "07899928199",
      "email": "Jim@gmail.com",
      "clinic": " Kitezi HCIII",
      "doctor": "2",
      "address": "Kampala",
      "request_date": "2020-05-23",
      "requested_date": "2020-05-24 00:00:00",
      "services": "Tooth Removal, Whitening, Cementing",
      "remarks": "Call Me",
      "status": "0"
    }
  ]
}
```
1. search request _post
http://localhost/api_dentalapp/Api/searchRequest/KEY
1. post data allows name,date,request_id strings
```javascript
{
  "searchTerm": "JIM"
}
```
1. response
```javascript
{
  "msg": "Data Found",
  "requests": [
    {
      "id": "5",
      "name": "Luck Jim",
      "mobile": "07899928199",
      "email": "Jim@gmail.com",
      "clinic": " Kitezi HCIII",
      "doctor": "2",
      "address": "Kampala",
      "request_date": "2020-05-23",
      "requested_date": "2020-05-24 00:00:00",
      "services": "Tooth Removal, Whitening, Cementing",
      "remarks": "Call Me",
      "status": "0"
    },
    {
      "id": "6",
      "name": "Luck Jim",
      "mobile": "07899928199",
      "email": "Jim@gmail.com",
      "clinic": " Kitezi HCIII",
      "doctor": "2",
      "address": "Kampala",
      "request_date": "2020-05-23",
      "requested_date": "2020-05-24 00:00:00",
      "services": "Tooth Removal, Whitening, Cementing",
      "remarks": "Call Me",
      "status": "0"
    }
  ]
}
```
1. post request to create  reply to a chat between doctors and patients
1.  NB: Message subjects are created when a request is posted
1. added the number since it a unique username for each user
1. Any ideas of how can make it realtime
http://localhost/api_dentalapp/Api/replymessages/KEY

```javascript
{
  "request_id": "4",
  "message_id": "6",
  "message_body": "All is okay",
  "name": "Dembe Denis",
  "mobile": "0702783738",
  "usertype": "Patient"
}
```
1. get all _messages and all replies
http://localhost/api_dentalapp/Api/messages/KEY
1. response
```javascript
{
  "msg": "Data Found",
  "messages": [
    {
      "message": {
        "id": "1",
        "followupdate": "2020-05-23 13:35:45",
        "request_id": "1",
        "body": "Tooth alignment, tooth whitening",
        "message_id": null,
        "name": "Agaba Andrew , 0702787688",
        "role": "Patient"
      },
      "reply": [
        {
          "id": "2",
          "followupdate": "2020-05-23 12:33:44",
          "request_id": "1",
          "body": "Thanks for get in touch with, we shall give you a call shortly to comfirm",
          "message_id": "1",
          "name": "Gordon Asiimwe",
          "role": "Doctor"
        },
        {
          "id": "5",
          "followupdate": "2020-05-23 13:36:26",
          "request_id": "1",
          "body": "Hope the service was satisfactory",
          "message_id": "1",
          "name": "Dr. Godwin",
          "role": "Doctor"
        }
      ]
    },
    {
      "message": {
        "id": "3",
        "followupdate": "2020-05-23 13:35:53",
        "request_id": "4",
        "body": "Need Help with Enamel Coating",
        "message_id": null,
        "name": "Dembe Denis",
        "role": "Patient"
      },
      "reply": [
        {
          "id": "4",
          "followupdate": "2020-05-23 13:36:20",
          "request_id": "4",
          "body": "Thanks Denis, we will call you shortly",
          "message_id": "3",
          "name": "Dr. Godwin",
          "role": "Admin"
        },
        {
          "id": "6",
          "followupdate": "2020-05-23 14:15:00",
          "request_id": "4",
          "body": "Dembe, how Enamel Coating holding",
          "message_id": "3",
          "name": "Dr. Birungi Deus",
          "role": "Doctor"
        }
      ]
    }
  ]
}
```

1. get clinic services
http://localhost/api_dentalapp/Api/services/KEY
1. response
```javascript
{
  "msg": "Data Found",
  "requests": [
    {
      "id": "1",
      "name": "Dental Implants",
      "img_url": "",
      "description": null
    },
    {
      "id": "2",
      "name": "Teeth Whitening",
      "img_url": "",
      "description": null
    },
    {
      "id": "3",
      "name": "Cosmic Braces",
      "img_url": "",
      "description": null
    }
  ]
}
```

get users messages and replies
http://localhost/api_dentalapp/Api/message/KEY 
1. postdata
```javascript
{
  "username": "0702787688"
}
{
  "msg": "Data Found",
  "messages": [
    {
      "message": {
        "id": "1",
        "followupdate": "2020-05-23 16:17:38",
        "request_id": "1",
        "body": "Tooth alignment, tooth whitening",
        "message_id": null,
        "name": "Agaba Andrew",
        "mobile": "0702787688",
        "role": "Patient"
      },
      "reply": [
        {
          "id": "2",
          "followupdate": "2020-05-23 12:33:44",
          "request_id": "1",
          "body": "Thanks for get in touch with, we shall give you a call shortly to comfirm",
          "message_id": "1",
          "name": "Gordon Asiimwe",
          "mobile": "",
          "role": "Doctor"
        },
        {
          "id": "5",
          "followupdate": "2020-05-23 13:36:26",
          "request_id": "1",
          "body": "Hope the service was satisfactory",
          "message_id": "1",
          "name": "Dr. Godwin",
          "mobile": "",
          "role": "Doctor"
        }
      ]
    }
  ]
}
```

1. create new doctor _post
1. creates a user account for the doctor with details login
http://localhost/api_dentalapp/Api/newdoctor/KEY
```javascript
{
  "work_id": "07726",
  "name": "Bruno James",
  "email": "jameson@yahoo.com",
  "mobile": "0787838768",
  "cadre": "Dental Assistant",
  "usertype":"Doctor"
}
1. response
{
  "error": "",
  "msg": "CREATED",
  "message": "Submitted",
  "logins": [
    {
      "uuid": "10",
      "username": "07277838328",
      "password": "d56b699830e77ba53855679cb1d252da",
      "apikey": null,
      "usertype": "Doctor",
      "name": "Prince James",
      "created_on": "2020-05-23 16:59:16",
      "status": "1"
    }
  ]
}
```
1. available doctors_post to get available for requests by schedule date
http://localhost/api_dentalapp/Api/availableDoctors/KEY
1. postdata
```javascript
{
  "searchDate": "2020-05-25"
}
1. response
{
  "msg": "Data Found",
  "requests": [
    {
      "id": "1",
      "name": "Sam Agaba",
      "cadre": "Dental Surgeon"
    },
    {
      "id": "2",
      "name": "Nkuke Henry",
      "cadre": "Dental Surgeon"
    }
  ]
}
```

1. get_doctors list
http://localhost/api_dentalapp/Api/doctors/KEY
```javascript
{
  "msg": "Data Found",
  "requests": [
    {
      "id": "1",
      "work_id": "CM871819191",
      "name": "Sam Agaba",
      "email": "agabaandre@gmail.com",
      "contacts": "0778787889",
      "cadre": "Dental Surgeon",
      "flag": "1"
    },
    {
      "id": "2",
      "work_id": "CM8718191916",
      "name": "Nkuke Henry",
      "email": "",
      "contacts": "077878789",
      "cadre": "Dental Surgeon",
      "flag": "1"
    },
    {
      "id": "3",
      "work_id": "e89929829",
      "name": "Dembe Denis",
      "email": "",
      "contacts": "078378299281",
      "cadre": "Dental Surgeon",
      "flag": "1"
    },
    {
      "id": "4",
      "work_id": "77277718",
      "name": "Jimmy Carter",
      "email": "",
      "contacts": "",
      "cadre": "Dental Surgeon",
      "flag": "1"
    },
    {
      "id": "5",
      "work_id": "213123YY37817",
      "name": "Asiimwe Gordon",
      "email": "",
      "contacts": "0781781788188",
      "cadre": "Dental Surgeon",
      "flag": "1"
    }
  ]
}

```
1. change password /reset password
http://localhost/api_dentalapp/Api/changePassword/KEY
```javascript
{
  "username": "admin",
  "oldpwd": "admin",
  "newpwd": "admin"
}
1. response

{
  "msg": "Success",
  "messages": "Changed Successful"
}

1. cancelRequest_post
http://localhost/api_dentalapp/Api/cancelRequest/KEY
1. postdata
{
  "requestId":"26"
}
1. response
{
  "msg": "Cancelled",
  "requests": {
    "dbstatus": "Cancelled"
  }
}
```

