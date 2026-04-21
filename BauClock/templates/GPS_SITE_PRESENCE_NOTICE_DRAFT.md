# BauClock — GPS / Site Presence Notice Draft

## Status

Draft worker-facing GPS / site presence notice.
Use only if GPS or comparable site validation is enabled.
This is a product template, not final legal advice.

---

## 1. Purpose

Your company uses site presence validation in BauClock to help verify whether a check-in/check-out event belongs to the correct work site.

---

## 2. What this validation is for

If enabled, location/site-presence logic is intended for:
- verifying site attendance
- reducing incorrect site check-ins
- supporting review of suspicious or disputed records

It is not intended for unnecessary continuous tracking outside the work-site context.

---

## 3. What may be processed

Depending on implementation, the system may process:
- location point at check-in/check-out time
- GPS accuracy metadata
- assigned site reference
- validation result / suspicious flag

---

## 4. Limitation principle

Site presence validation should be limited to the minimum needed for the work-site attendance workflow.
The system should not become a general background movement-tracking tool.

---

## 5. Access and visibility

Location/site validation data should only be visible to authorized roles with a legitimate operational need.

---

## 6. Acknowledgement note

For real product use, workers should be shown this notice where GPS/site presence logic is enabled and should acknowledge receiving it.
This template must be reviewed and finalized before production use.
