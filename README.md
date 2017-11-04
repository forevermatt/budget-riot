# Budget
A simple way to budget your money and reconcile your statements.

## Priorities

1. As easy-to-use as possible.
2. "Offline first" approach.
3. As much of it as possible should be completely free.
4. Minimize cost of operations/infrastructure.
5. For features that require some level of infrastructure (and therefore
   potentially incur a cost), keep the cost _really_ low (see priority 4).

## Coding Glossary

- `Budget`: A user's plan for how they want to spend their money in a given
   month.
- `BudgetApp`: This budgeting application, probably running in a user's browser.
- `Category`: Part of a user's Budget, indicating how much they are willing to
  spend on a particular type of expense each month.
- `DataService`: Something to handle a particular collection of data. For
  example, there may be an `accountService` (for handling data about accounts),
  a `categoryService` (for handling data about categories), etc.
- `DataStore`: A way to persist the application's data (such as `localStorage`).
- `DataManager`: The gate-keeper for managing the application logic's
  interaction with the data structures.
- `id`: A `string` that uniquely identifiers an item within the context of that
  type of item. For example, there should only be one Account with a given `id`.
  Also note that an `id` must be a `string` (or `undefined`); otherwise
  comparison of `id` values is inconsistent.
- `Page`: A section of the BudgetApp, such as the category-list page or the
  expense-amount page.

## Data Structure

**Note:** Data structure versions do NOT necessarily correlate with application
versions. For example, version 0.2.1 of the application may still use data
structure version 0.1.0 (theoretically).

### Data Structure Migrations

The goal is to provide an automated migration process from one data structure
version to the next.

### Data Structure Versions

- Data structure version 0.1.0

        {
          "version": "*data structure version of this data*",
          "accounts": {
            "*account id*": {
              "name": "*account name*",
              "id": *account id*
            },
            *...*
          },
          "budget": {
            "*YYYY-MM*": {
              "*category id*": {
                "budgetedAmount": *allotted amount for this month, in cents*,
                "remaining": *amount left after subtacting this month's*
                             *activity from last month's remaining amount for*
                             *this category*
              },
              *...*
            },
            *...*
          },
          "categories": {
            "*category id*": {
              "name": "*category name*",
              "id": *category id*
            },
            *...*
          },
          "incomeSources": {
            "byName": {
              "*payee name*": true,
              *...*
            }
          },
          "payees": {
            "byName": {
              "*payee name*": true,
              *...*
            }
          },
          "transactions": {
            "*YYYY-MM*": [
              {
                "accountId": *account id*,
                "amountTotal": *transaction total, in cents*,
                "categories": {
                  "*category id*": {
                    "name": "*category name*",
                    "amount": *amount from this category, in cents*
                  },
                  *...*
                },
                "whenTimestamp": *date/time of transaction, as JS unix timestamp*,
                "who": "*name of payee*"
              }
            ]
          }
        }
