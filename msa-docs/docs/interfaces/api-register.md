FORMAT: 1A
HOST: http://locahost/api-register/

# Register

Register is a simple API to manage employees. You can view this documentation over at [API Vacation Module](../../modules/api-register).

# Register API Root [/]

This resource does not have any attributes. Instead it offers the initial API affordances in the form of the links in the JSON body.

It is recommend to follow the “url” link values, [Link](https://tools.ietf.org/html/rfc5988) or Location headers where applicable to retrieve resources. Instead of constructing your own URLs, to keep your client decoupled from implementation details.

## Retrieve the Entry Point [GET]

- Response 200 (application/json)

        {
            "employee": "/employee",
            "relative": "/relative"
        }

## Group Employee

Resources related to employees in the API.

## Employee [/employee/{register}]

A Employee object has the following attributes:

- register
- hired_at - An RFC3339 date when the employee was hired.
- fired_at - An RFC3339 date when the employee was fired, if don't null.
- name - The name of the employee
- position - The name of the employee position
- gross_salary - The gross amount of the employee salary in form of a float

- Parameters
  - register: 1 (required, number) - ID of the Employee in form of an integer

### View a Employee Detail [GET]

- Response 200 (application/json)

        {
            "register": 1,
            "hired_at":  "1962-08-15T08:00:00.000Z",
            "fired_at": null,
            "name": "Peter Parker",
            "position": "Friendly Neighborhood",
            "gross_salary": 1.99
        }

### Hire a New Employee [POST]

You may hire a new employee (if you have this permission) using this action. It takes a JSON object containing a employee and his infos. On this action you don't have to add `{register}` in the URL.

- name (string) - The employee name
- position (string) - The employee position
- gross_salary (float) - The employee gross salary

- Request (application/json)

        {
            "name": "Nick Fury",
            "position": "SHIELD Leader",
            "gross_salary": 99999.99
        }

- Response 201 (application/json)

  - Headers

         Location: /employee/4

  - Body

         {
           "register": 4
           "name": "Nick Fury",
           "hired_at": "2019-09-30T11:30:41.789Z",
           "fired_at": null,
           "position": "SHIELD Leader",
           "gross_salary": 99999.99
         }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

### Update a Employee [PATCH]

You may update a employee information (if you have this permission) using this action. It takes a JSON object containing a employee and the info that you want to update.

- name (string) - The employee name
- position (string) - The employee position
- gross_salary (float) - The employee gross salary

- Request (application/json)

        {
            "position": "SHIELD Chief",
            "gross_salary": 9999999.99
        }

- Response 201 (application/json)

  - Headers

         Location: /employee/4

  - Body

         {
           "register": 4,
           "name": "Nick Fury",
           "hired_at": "2019-09-30T11:30:41.789Z",
           "fired_at": null,
           "position": "SHIELD Chief",
           "gross_salary": 9999999.99
         }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

### Fire a Employee [DELETE]

You may fire a employee (if you have this permission) using this action. His information will remain in the system but the `fired_at` attribute will receive the date of the action.

- Response 200

  - Headers

         Location: /employee/4

  - Body

         {
           "register": 4,
           "name": "Nick Fury",
           "hired_at": "2019-09-30T11:30:41.789Z",
           "fired_at": "2020-09-30T08:01:12.812Z",
           "position": "SHIELD Chief",
           "gross_salary": 9999999.99
         }

- Response 401

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

## Group Relative

Resources related to relatives in the API.

## Relative [/relative/{employee_register}/{id}]

A Relative object has the following attributes:

- employee_register
- id
- name
- kinship

- Parameters
  - employee_register: 1 (required, number) - ID of the employee which is related to the relative in form of an integer
  - id: 1 (required, number) - ID of the relative in form of an integer

### View a Relative Detail [GET]

- Response 200 (application/json)

        {
            "employee_register": 1,
            "id": 1,
            "name": "May Parker",
            "kinship": "Aunt"
        }

### Add a New Relative [POST]

You may add a new relative (if you have this permission) using this action. It takes a JSON object containing a relative and his infos. On this action you don't have to add the relative `{id}` in the URL, only the `{employee_register}`.

- name (string) - The relative name
- kinship (string) - The relative kinship type name

- Request (application/json)

        {
            "name": "Mary Jane Watson",
            "kinship": "Wife"
        }

- Response 201 (application/json)

  - Headers

         Location: /relative/1/2

  - Body

         {
           "id": 2,
           "employee_register": 1,
           "name": "Mary Jane Watson",
           "kinship":  "Wife"
         }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

### Update a Relative [PATCH]

You may update a relative information (if you have this permission) using this action. It takes a JSON object containing a relative and the info that you want to update.

- name (string) - The relative name
- kinship (string) - The relative kinship type name

- Request (application/json)

        {
            "name": "Mary Jane Watson",
            "kinship": "Ex-Wife"
        }

- Response 201 (application/json)

  - Headers

         Location: /relative/1/2

  - Body

         {
           "id": 2,
           "employee_register": 1,
           "name": "Mary Jane Watson",
           "kinship":  "Ex-Wife"
         }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

### Remove a Relative [DELETE]

You may remove a relative (if you have this permission) using this action.

- Response 200

  - Headers

         Location: /relative/1

  - Body

         {
           "old_value": {
             "employee_register": 1,
             "name": "Mary Jane Watson",
             "kinship":  "Ex-Wife"
           }
         }

- Response 401

  - Body

         {
            "message": "You're not allowed to perform this action"
         }
