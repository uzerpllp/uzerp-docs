+++
title = "2FA with Twilio Verify"
description = "Secure uzERP user logins with multi-factor authentication using Twilio Verify"
weight = 90
+++

*Available Since release 1.31.0*

## What is Twilio Verify

[Twilio Verify](https://www.twilio.com/verify) is a service that validates users after they have logged into uzERP with their username and password. Twilio Verify supports verification via SMS, voice, push message, etc. but uzERP only implements time-based one-time passwords ([TOTP](https://en.wikipedia.org/wiki/Time-based_one-time_password)).

With TOTP, users enroll with Twilio and then use codes obtained from an app on their phone, computer or tablet. Some suitable apps are [Authy](https://authy.com/) and [Google Authenticator](https://play.google.com/store/apps/details?id=com.google.android.apps.authenticator2).

Before configuring uzERP you will need to create an account and a Verify service with Twilio.

## Configure uzERP for TOTP 2FA with Twilio

### Set injector classes

- Set the `LoginHandler` class to `HTMLFormLoginHandlerMFA`.
- Add the `MFAValidator` class, if not present, and set it to `TWValidator`.

{{% alert title="Note" %}}
At the time of writing, editing and creation of system-wide injector classes is not supported in the web UI and should be done in the database, via SQL.
{{% /alert %}}

### Add Twilio settings to the uzERP configuration file

Add the Twilio secrets to the `config/.env` file in uzERP:

```bash
# Example settings

TWILIO_ACCOUNT_SID="ACxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
TWILIO_AUTH_TOKEN="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
TWILIO_SERVICE_SID="VAxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

### Update PHP session management settings (optional)

Twilio will charge your account for each successful validation. uzERP session management can be configured with an appropriate user activity timeout and max age in seconds in the `config/.env` file.

The above settings should be chosen carefully to balance user convenience, security and cost based on your threat model.

```bash
# Example settings

# Let uzERP manage user session timeout and maximum age.
# If included and true, uzERP manages session age.

UZERP_MANAGE_USER_SESSIONS=true

# If UZERP_MANAGE_USER_SESSIONS is true, the following
# variables must be set.

USER_ACTIVITY_TIMEOUT_SECS=28800 #30 Mins = 1800
USER_SESSION_MAX_AGE_SECS=28800 #8 hours
```
{{% alert title="Note" %}}
If the platform that you run uzERP on manages PHP session clean-up, like Ubuntu, then you will need to turn off your platform's PHP session management to allow uzERP to manage sessions or set `UZERP_MANAGE_USER_SESSIONS=false` to continue to allow your platform to manage sessions.
{{% /alert %}}

## User management with 2FA

The `user` database table includes some fields to support 2FA:

| Field Name | Description |
| ---- | --------- |
| uuid | Unique user id, used to reference the user with the 2FA service to avoid providing any personal information. |
| mfa_sid | Identifies the factor to be verified so that the service can select the correct secret to validate the user's token. |
| mfa_enrolled | The user has successfully been enrolled for 2FA. |
| mfa_enabled | Indicates that 2FA is enabled for the account. |


Verification can be disabled for the next user login from the Web UI and is automatically re-enabled once the user has been validated.

A user's 2FA status can also be reset, which removes the `mfa_sid` and sets `mfa_enrolled` and `mfa_enabled` to `false`. The user is then required to re-enroll on their next login.

## User enrollment

Once 2FA is enabled users will be required to enroll with the service using their chosen app.

When an un-enrolled user logs in with their usual username and password uzERP will obtain a new TOTP secret from Twilio and present a QR code and plaintext secret that the user can use to set-up their app. The app will then provide a code that the user must enter into uzERP for verification.

After successful verification the user will be logged in to uzERP. Once enrolled the user will need to enter a code from their app each time they login to uzERP.