FORMAT: 1A
HOST: http://locahost/api-auth/

# Auth

Auth is a API using Keycloack and JWT to authenticate and manage users in the RH App Domain. You can view his documentation over at [API Auth Module](../../modules/api-auth).

# Auth API Root [/]

This resource does not have any attributes. Instead it offers the initial API affordances in the form of the links in the JSON body.

It is recommend to follow the “url” link values, [Link](https://tools.ietf.org/html/rfc5988) or Location headers where applicable to retrieve resources. Instead of constructing your own URLs, to keep your client decoupled from implementation details.

## Retrieve the Entry Point [GET]

- Response 200 (application/json)

        {
            "session": "/session"
            "user": "/user"
        }

## Group Session

Resources related to sessions in the API.

## Session [/session]

A Session object has the following attributes:

- email
- password

## User Session

Resources related to users in the API

## User [/user/{user_id}]

A User object has the following attributes:

- name
- created_at - A RFC3339 date when the user was created.
- updated_at - A RFC339 date when the user was updated.
- email - A string with user e-mail
- groups - An array of groups identifiers which user has access.
- url

- Parameters
  - user_id: 1 (required [some routes], uuid) - ID of the User in form of an UUID

### View a User Detail [GET]

- Response 200 (application/json)

        {
            "name": "Peter Parker",
            "created_at": "2014-11-11T08:40:51.620Z",
            "updated_at": "2018-08-21T21:16:09.712Z",
            "email": "peter.parker@email.com",
            "groups": [
              "worker",
              "heroes"
            ]
            "url": "/user/83883e79-65f1-42bc-82ce-33615b47fcca",
        }

### Create a new User [POST]

You may create a new user (if you have this permission) using this action. It takes a JSON object containing a user and all his infos. On this action you don't have to add `{user_id}` in the URL.

- name (string) - The user name
- email (string) - The user email
- groups (array[string]) - The list of groups which the user will have access

- Request (application/json)

        {
            "name": "Miles Morales",
            "email": "miles.morales@email.com"
            "groups": [
                "workers",
                "heroes",
                "admins"
            ]
        }

- Response 201 (application/json)

  - Headers

         Location: /user/ad609b8d-ae9b-4487-bff4-8b1f995a323d

  - Body

         {
           "name": "Miles Morales",
           "created_at": "2019-09-25T12:01:41.091Z",
           "updated_at": "2019-09-25T12:01:41.091Z",
           "email": "miles.morales@email.com",
           "groups": [
             "worker",
             "heroes",
             "admins"
           ]
           "url": "/user/ad609b8d-ae9b-4487-bff4-8b1f995a323d",

    }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

### Update a User [PATCH]

You may update a user info (if you are the user or if you have this permission) using this action. It takes a JSON object containing a user and all the infos you want to update.

- name (string) - The user name (optional)
- email (string) - The user email (optional)
- groups (array[string]) - The list of groups which the user will have access (optinal)

- Request (application/json)

        {
            "groups": [
                "workers",
                "heroes"
            ]
        }

- Response 201 (application/json)

  - Headers

         Location: /user/ad609b8d-ae9b-4487-bff4-8b1f995a323d

  - Body

         {
            "name": "Miles Morales",
            "created_at": "2019-09-25T12:01:41.091Z",
            "updated_at": "2019-09-26T08:15:38.920Z",
            "email": "miles.morales@email.com",
            "groups": [
               "worker",
               "heroes"
            ]
            "url": "/user/ad609b8d-ae9b-4487-bff4-8b1f995a323d",
          }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

### Remove a User [DELETE]

You may remove a user (if you have this permission) using this action.

- Response 200

- Response 401

  - Body

         {
            "message": "You're not allowed to perform this action"
         }
