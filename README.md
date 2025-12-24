# CRM Database

This repository contains a MySQL dump that models a CRM-style database for managing members, events, staff, and related operations. Use it to spin up a sample dataset for demos, analytics practice, or seeding a new environment.

## Contents

- `Database_SQL.sql` — full MySQL dump including table definitions, foreign keys, and seed data.
- `CRM_DBMS (1).docx` and `SqlQueries.docx` — documentation and example queries

## Schema highlights

The dump defines tables for several functional areas:

- **Events & attendance**: `event` links to `event_type` and `spaces`, with pricing for public vs. members and expected capacity. Attendance is tracked in `attendance_log`, associating check-ins to members, events, and spaces. Bookings connect member registrations, events, and payments.
- **Members & memberships**: Core member records capture contact info, membership tier, login history, addresses, interests, tags, and subscriptions to track renewals. Related lookup tables (`membership`, `interests`, `tags`) and junction tables (`member_interest`, `member_tag`) model preferences and segmentation. Newsletter opt-in is stored on the member row for communication workflows.
- **Payments**: `payment` captures amounts, dates, and methods, tied to `payment_reason` to distinguish membership fees from event bookings.
- **Staff & operations**: Staff and HR data include contracts, salary type, workplace modality, addresses, and attendance logs, all tied through foreign keys for integrity.
- **Feedback and inquiries**: Member feedback on events, as well as inquiries with types and user roles, help track engagement and support history.
- **Founding members**: Dedicated tables store founding member details and addresses for governance or donor recognition needs.

## Usage ideas

- Explore example data for analytics or dashboard prototypes.
- Practice SQL joins across members, events, payments, and staff records.
- Extend the schema by adding new lookup tables or modifying foreign keys to fit your use case.
