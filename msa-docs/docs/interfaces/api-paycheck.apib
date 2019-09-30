FORMAT: 1A
HOST: http://locahost/api-paycheck/

# Paycheck

Paycheck is a API used to manage all workers paycheck, benefits and others questions related to wage. You can view his documentation over at [API Paycheck Module](../../modules/api-paycheck).

# Paycheck API Root [/]

This resource does not have any attributes. Instead it offers the initial API affordances in the form of the links in the JSON body.

It is recommend to follow the “url” link values, [Link](https://tools.ietf.org/html/rfc5988) or Location headers where applicable to retrieve resources. Instead of constructing your own URLs, to keep your client decoupled from implementation details.

## Retrieve the Entry Point [GET]

- Response 200 (application/json)

        {
            "paycheck": "/payroll"
        }

## Group Payroll

Resources related to questions in the API.

## Payroll [/payroll/{year}/{month}/{payroll_number}{?{filter}={value}&}]

A Payroll object has the following attributes:

- payroll_number
- year
- month
- status
- employees
- payment

- Parameters
  - payroll_number: 1 (optional, number) - Number of the Payroll in form of an integer
  - year: 2019 (optional, number) - The year of the Payroll
  - month: 2 (optional, number) - The month of the Payroll
  - status: true (optional, boolean) - The status of the paycheck (true if active, false otherwise)

### View a Payroll Details [GET]

- Request (URL)

        URL: /payroll/2019/8/1?status=true

- Response 200 (application/json)

        {
            "payroll_number": 1,
            "year": 2019,
            "month": 8,
            "status": true,
            "employees": [
              "Miles Morales",
              "Peter Parker"
            ],
            "payment": [
              1.99,
              1.99
            ]
        }

### Create a new Payroll [POST]

You may create a new payroll (if you have this permission) using this action. It takes a URL with the creation parameters. If there is a payroll for the given year and month, a new one will be created and the last one will be deactivated.

- year (number) - The year of the Payroll
- month (string) - The month of the Payroll

- Request (URL)

      URL: /payroll/2019/9

- Response 200 (application/json)

        {
            "payroll_number": 1,
            "year": 2019,
            "month": 9,
            "status": true,
            "employees": null,
            "payment": null,
        }

- Response 200 (application/json)

        {
            "new_payroll": {
              "payroll_number": 2,
              "year": 2019,
              "month": 9,
              "status": true,
              "employees": null,
              "payment": null,
            },
            "old_payroll": {
              "payroll_number": 1,
              "year": 2019,
              "month": 9,
              "status": true,
              "employees": [
                "Miles Morales",
                "Peter Parker"
             ],
              "payment": [
                1.99,
                1.99
              ]
            }

        }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

### Update information on the Payroll [PATCH]

You may update the payroll (if you have this permission) using this action. It takes a JSON with the objects you want to update. The updatable parameters are the following (if the objects is already fullfiled it will be overwrited):

- status (boolean) - The status of the paycheck
- employees (array[string]) - The list of employees that will be payed on that payroll
- payment (array[float]) - The value of the employees salary

- Request (URL)

      URL: /payroll/2019/9/2

- Request (application/json)

        {
            "employees": [
              "Steve Rogers",
              "Miles Morales",
              "Peter Parker"
            ],
            "payment: [
              3.99,
              1.99,
              1.99
            ]
        }

- Response 200 (application/json)

        {
            "payroll_number": 1,
            "year": 2019,
            "month": 9,
            "status": true,
            "employees": [
              "Steve Rogers",
              "Miles Morales",
              "Peter Parker"
            ],
            "payment": [
              3.99,
              1.99,
              1.99
            ]
        }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }

### Delete Payroll [DELETE]

You may create a new payroll (if you have this permission) using this action. It takes a URL with the search to delete parameters. Caution, this action is irreversible.

- Request (URL)

      URL: /payroll/2019/9/2

      OR

      URL: /payroll/2019?month=9&status=false

- Response 200 (application/json)

  - Body

         {
            "deleted_payrolls": [2]
         }

         OR

         {
           "deleted_payrolls": [2, 3]
         }

- Response 401 (application/json)

  - Body

         {
            "message": "You're not allowed to perform this action"
         }
