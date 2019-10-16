FORMAT: 1A
HOST: http://locahost/api-vacation/

# Vacation

Vacation is a simple API to manage employees vacations and vacation scheduling. You can view this documentation over at [API Vacation Module](../../modules/api-vacation).

This API blueprint resource can be found at [API Vacation Blueprint](./api-auth.apib).

# Vacation API Root [/]

This resource does not have any attributes. Instead it offers the initial API affordances in the form of the links in the JSON body.

It is recommend to follow the “url” link values, [Link](https://tools.ietf.org/html/rfc5988) or Location headers where applicable to retrieve resources. Instead of constructing your own URLs, to keep your client decoupled from implementation details.

## Retrieve the Entry Point [GET]

- Response 200 (application/json)

        {
            "vacation": "/vacation"
        }

## Group Vacation

Resources related to questions in the API.

## Vacation [/vacation/{year}/{month}]

A Question object has the following attributes:

- year - An integer representing the year
- month - An integer representing the month
- number_employees - An integer representing how many employees have vacation
- employees - An array of Employees objects with vacation info

- Parameters
  - year: 2019 (required, number) - Given vacation year
  - month: 9 (required, number) - Given vacation month

### View a Vacation Detail [GET]

- Response 200 (application/json)

        {
            "year": 2019,
            "month": "september",
            "number_employees": 2,
            "employees": [
              {
                "register": 1,
                "name": "Peter Parker",
                "start": "2019-09-01",
                "end": "2019-09-15"
              },
              {
                "register": 2,
                "name": "Miles Morales",
                "start": "2019-09-15",
                "end": "2019-09-30"
              }
            ]
        }

### Create/Update a Employee Vacation [POST]

You may create/update a employee vacation (if you have this permission) using this action. It takes a JSON object containing a employee and all vacation infos. If the employee with the given register already exist this action will override the information. The employee-vacation object have the following structure.

- register (integer) - The employee register
- name (string) - The employee name
- start (date) - The start date of the employee vacation
- end (date) - The end date of the employee vacation

- Request (application/json)

        {
            "register": 3
            "name": "Tony Stark",
            "start": "2019-09-01",
            "end": "2019-09-30"
        }

- Response 201 (application/json)

  - Headers

         Location: /vacation/2019/9

  - Body

         {
            "year": 2019,
            "month": "september",
            "number_employees": 3
        }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

### Remove a Employee Vacation

You may remove a employee vacation (if you have this permission) using this action. It takes a JSON object containing a employee register. The employee-vacation object have the following structure.

- register (integer or array[integer]) - The employee register

- Request (application/json)

        {
            "register": [2, 3]
        }

- Response 201 (application/json)

  - Headers

         Location: /vacation/2019/9

  - Body

         {
            "year": 2019,
            "month": "september",
            "number_employees": 1
        }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }
