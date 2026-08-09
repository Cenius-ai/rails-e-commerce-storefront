# Installation

## 1. Prerequisites

- **Ruby 3.3.11** (use a version manager like rbenv or rvm)
- **Bundler**: install with `gem install bundler`
- **PostgreSQL**: running and accessible (the `pg` gem connects to it)
- **Docker** (optional, for containerized production deployment)

## 2. Get the Code

Clone or download the project source code to your local machine.

## 3. Install Dependencies

```bash
bundle install
```

## 4. Database Setup

Create the databases and run migrations:

```bash
bin/rails db:create
ruby bin/rails db:migrate
```

Then seed the database with sample products and categories:

```bash
bin/rails db:seed
```

## 5. Environment Variables

Copy the example environment file and adjust as needed:

```bash
cp .env.example .env
```

For development, the defaults in `config/database.yml` usually work. For production, set `RAILS_MASTER_KEY` and `DATABASE_URL` in `.env`.

## 6. Run the Development Server

```bash
bin/rails server
```

The application will be available at `http://localhost:3000`.

## 7. Run Tests

```bash
bin/rails test
```

## 8. Build for Production

Precompile assets:

```bash
bin/rails assets:precompile
```

Alternatively, build the Docker image:

```bash
docker build -t rails-storefront .
```

Then run it:

```bash
docker run -d -p 3000:3000 -e RAILS_MASTER_KEY=<your-key> rails-storefront
```

## 9. Troubleshooting

- **Gem install errors**: ensure Ruby 3.3.11 and Bundler are correctly installed. Run `gem install bundler -v 2.5.17` if needed.
- **Database connection refused**: verify PostgreSQL is running and the configuration in `config/database.yml` matches your setup.
- **Port already in use**: stop any other server on port 3000, or use `bin/rails server -p 3001`.
- **Admin login issues**: the admin user is seeded via `db/seeds.rb`; check the seeds for credentials or create a new admin via the Rails console.