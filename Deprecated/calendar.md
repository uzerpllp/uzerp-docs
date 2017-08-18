# Calendar

The calendar provides the ability to add, view, manage and share events. Views currently available are day, week and month, the agenda view is coming soon. 

## Calendar Types

### Permissions Table

 |             | Personal | Group | Google Calendar | 
 |             | -------- | ----- | --------------- | 
 | owner       | rw       | rw    | rw              | 
 | shared user | r        | rw    | r               | 

### Personal Calendar

The personal calendar is the most basic type of calendar, events can be added and managed. The personal view can be shared amongst any system users apart from the owner, users that are seelcted as shared users have read only access.

### Group Calendar

The group calendar is similar to the personal calendar, however users that have been selected as shared users have read and write access. Any event will be owned by the user that created it, and only that user can edit the event.

### Google Calendar

It is now possible to integrate Google Calendar with the uzERP calendar, Google Calendar events will appear alongside a users normal events in the day, week and month views. A user must have access to the calendars private XML feed to allow read access, Google allows this private feed to be reset, if this occurs the user must update the feed address in uzERP.

Like the personal calendar type, Google Calendars can be shared amongst any number of system users, however nobody, including the owner has built in write access, this must be done via the Google Calendar system.

To gain access to the private XML feed, go to the Google Calendar application and follow these steps:

Settings > Calendars > [Calendar Name]

Right click on the private XML feed icon and click 'Copy link location', in uzERP, click 'Add Google Calendar', paste this feed address into the relevant field, the rest of the process is automatic.

{{:gcal_save_xml_as.png|}}

## Known Issues

*  When dragging an event (to edit it's start time / duration) any visible Google Calendars disappear until next refresh.

*  Agenda does not support Google Calendar events.

