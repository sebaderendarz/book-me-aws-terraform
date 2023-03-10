# **BookMe - hairdresser service booking platform**

App for matching hairdressers with potential clients. Backend in Django + Django Admin. Frontend in React. Everything containerized and ready to run with docker compose in the development environment. There is a dedicated, AWS + Terraform configuration for the production use.

## Deployment AWS + Terraform

There is a dedicated [README](./terraform/README.md) in the folder with Terraform configuration.

## Initial setup of Django based API on production

1. Apply db migrations `python manage.py migrate`.
2. Collect static files needed to make Django Admin Panel working properly `python manage.py collectstatic`.
3. By default green Django theme is used, but theme should be changed to USWDS. Add USWDS theme `python manage.py loaddata admin_interface_theme_uswds.json`.
4. Change Django Admin Panel theme to USWDS:
    1. Login to Django Admin Panel using your admin account credentials.
    2. Go to Home -> Admin Interface -> Themes and change theme to USWDS.
    3. NOTE: In case you do not have the admin account created yet, you should create the superuser/admin account `python manage.py createsuperuser`.
    4. List of available themes [HERE](https://github.com/fabiocaccamo/django-admin-interface#optional-themes).
5. Adjust texts and logos in Django Admin Panel to follow the context of the BookMe app. Go to Django Admin Panel -> Home -> Admin Interface -> Themes -> USWDS and change:
    1. Logo `/frontend/public/media/bookme_200_white.png`.
    2. Favicon `/frontend/public/media/bookme_200_white.png`.
    3. Title `BookMe`.

## Running the stack locally

1. Run `sudo yum install -y git` to install git.
2. Pull the app repo from remote. Use ssh based URL.
3. Run `install_deps.sh` script. You might be prompted to type sudo password a few times.
4. Configure settings for each container. Add `development.env` file to each subdirectory in `/service-config/*`. Configure settings based on descriptions in dedicated README files.
    1. Article explaining CORS configuration in Django [LINK](https://www.stackhawk.com/blog/django-cors-guide/#what-is-cors).
    2. The best would be to take a look at values that were specified for these variables on some server running in the past.
    3. Django app is configured to use Sendgrid as a mailing provider. Sendgrid offers free 100 emails/day and you can create custom email templates.
5. Run `make up`. To see the full list of available commands run `make help`.
6. Django based API needs some manual steps to have it ready for the production-like use:
    1. Apply db migrations by running `make migrate`.
    2. Collect static files needed to make Django Admin Panel working properly by running `make collectstatic`.
    3. By default green Django theme is used, but theme should be changed to USWDS. Add USWDS theme by running `make django cmd='loaddata admin_interface_theme_uswds.json'`.
    4. Change Django Admin Panel theme to USWDS:
       1. Login to Django Admin Panel using your admin account credentials.
       2. Go to Home -> Admin Interface -> Themes and change theme to USWDS.
       3. In case you don't have the admin account created yet you can create a superuser/admin account by running `make django cmd=createsuperuser`.
       4. List of available themes [here](https://github.com/fabiocaccamo/django-admin-interface#optional-themes).
    5. Adjust texts and logos in Django Admin Panel to follow the context of the BookMe app. Go to Django Admin Panel -> Home -> Admin Interface -> Themes -> USWDS and change:
       1. Logo to the one located in `/frontend/public/media/bookme_200_white.png`.
       2. Favicon to the one located in `/frontend/public/media/bookme_200_white.png`.
       3. Title to `BookMe`.

## Code formatting and linting

There are linting tools configured to keep the python code neat. Before merging new changes run `make format-api` to automatically format code e.g line length. After that run `make lint-api` to check if linting is correct and make changes accordingly if linting tools found some inconsistencies.
Consider using [pre-commit](https://pre-commit.com/).
