# Notify SMS Service

A lightweight Rails microservice for sending SMS notifications as part of the Notify app ecosystem.

## Overview

This service provides a simple REST API endpoint for sending SMS notifications. It validates phone numbers in E.164 format and stores notification records in PostgreSQL.

## Requirements

- Ruby 3.2.2
- PostgreSQL
- Docker (optional)

## Quick Start

### Local Development

1. **Install dependencies**
   ```bash
   bundle install
   ```

2. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   ```

3. **Start the server**
   ```bash
   rails server
   ```

The service will be available at `http://localhost:3002`

### Docker

```bash
docker build -t notify-sms-service .
docker run -p 3002:3002 notify-sms-service
```

## API Reference

### Send SMS Notification

**POST** `/send`

Send an SMS notification to a phone number.

#### Request Body
```json
{
  "notification": {
    "phone_number": "+1234567890",
    "title": "Alert",
    "content": "Your notification message here"
  }
}
```

#### Response
**Success (200)**
```json
{
  "message": "Notification SMS sent successfully"
}
```

**Error (422)**
```json
{
  "errors": ["Phone number must be in E.164 format", "Content can't be blank"]
}
```

### Health Check

**GET** `/up`

Returns service health status.

## Validation Rules

- **Phone number**: Must be in E.164 format (e.g., `+1234567890`)
- **Content**: Required, maximum 160 characters
- **Title**: Optional

## Development

### Running Tests

```bash
bundle exec rspec
```

### Code Linting

```bash
bundle exec rubocop
```

## Database Schema

The service uses a simple `notifications` table:
- `id`: Primary key
- `phone_number`: String (E.164 format)
- `created_at`: Timestamp
- `updated_at`: Timestamp

## Configuration

The service uses standard Rails environment variables:
- `DATABASE_URL`: PostgreSQL connection string
- `RAILS_ENV`: Environment (development/test/production)
- `PORT`: Server port (default: 3002)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/new-feature`)
3. Run tests (`bundle exec rspec`)
4. Run linter (`bundle exec rubocop`)
5. Commit your changes (`git commit -am 'Add new feature'`)
6. Push to the branch (`git push origin feature/new-feature`)
7. Create a Pull Request
