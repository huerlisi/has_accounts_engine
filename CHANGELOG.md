<a name="3.0.0.beta14"></a>
## 3.0.0.beta14 (2016-01-07)


#### Features

* **print**  add printing action item to account lists ((870e933d))
* **Booking**  increment code when copying Booking ((c85196e4))



<a name="3.0.0.beta13"></a>
## 3.0.0.beta13 (2015-11-06)


#### Bug Fixes

* **bookings**  fix booking form ((a2de212d))



<a name="3.0.0.beta12"></a>
## 3.0.0.beta12 (2015-11-03)


#### Bug Fixes

* **print**  hide action column in accounts view ((d662aa21))

#### Features

* **print**  add print buttons to account and booking views ((8ee41dd8))



<a name="3.0.0.beta11"></a>
## 3.0.0.beta11 (2015-11-03)


#### Features

* **bookings**  add filter form field for booking code ((5d459dc1))
* **accounts**  support per page parameter for account journal ((37976453))

#### Bug Fixes

* **accounts**  fix default page expression in account view ((178ecf48))



<a name="v3.0.0.beta10"></a>
## v3.0.0.beta10 (2015-09-03)


#### Bug Fixes

* **bookings**
  *  pager needs to be updated when searching ([41ee4cb5](https://github.com/huerlisi/has_accounts_engine/commit/41ee4cb53fa812eaba083247b6bb12adae1bdd69))
  *  show full booking form instead of in-line ([1527ba49](https://github.com/huerlisi/has_accounts_engine/commit/1527ba49511f495337f255e2ec546e5d7c5acbc5))
* **i18n**
  *  add missing translations for en ([6977a37b](https://github.com/huerlisi/has_accounts_engine/commit/6977a37b1e48beabfc66887e8ac61bf5db6605a4))
  *  fix translations for booking filter ([950e1853](https://github.com/huerlisi/has_accounts_engine/commit/950e1853e383add2da6da78c5f0e85cf6a43b0c7))
* **styling**  fix alignment of booking journal filter ([34f84fd5](https://github.com/huerlisi/has_accounts_engine/commit/34f84fd5d658ead336b904945dc3203f88190008))

#### Features

* **Bookings**  support by_amount and by_date scopes ([29f808eb](https://github.com/huerlisi/has_accounts_engine/commit/29f808eb3b58050f384df209268af2a7fc8c83a1))
* **accounts**
  *  do not call accounts with a date range from index ([4295b7e6](https://github.com/huerlisi/has_accounts_engine/commit/4295b7e6ad886aff6c7e3f5732cdad0860019297))
  *  drop saldo column in account list ([eaf4d0e6](https://github.com/huerlisi/has_accounts_engine/commit/eaf4d0e6b3a48f9af73f8c0d88303d63da8cd0b2))
* **bookings**
  *  show code in lists ([c3803ee7](https://github.com/huerlisi/has_accounts_engine/commit/c3803ee78f3413b201b0f20b1fcb3c4c0a6b3d8a))
  *  use same booking form in all cases ([6cafad93](https://github.com/huerlisi/has_accounts_engine/commit/6cafad93d55ab2fb595a1a15829b32dcd616dc2d))
  *  drop two step creation of new bookings ([e9fef5b4](https://github.com/huerlisi/has_accounts_engine/commit/e9fef5b4943d8aef3ad1aede87890ac0779f358c))
  *  add filter form to bookings index ([2f6f2601](https://github.com/huerlisi/has_accounts_engine/commit/2f6f260180f6ed9a7732b98b7973c0f9f67ab14d))
* **filter**  the journal filter uses the fiscal year ([6c185830](https://github.com/huerlisi/has_accounts_engine/commit/6c1858302d4922c1dafb4c832dc5cfb619954cee))



<a name="3.0.0.beta9"></a>
## 3.0.0.beta9 (2015-09-02)


#### Features

* **bookings**
  *  use same booking form in all cases ((6cafad93))
  *  drop two step creation of new bookings ((e9fef5b4))
  *  add filter form to bookings index ((2f6f2601))
* **accounts**
  *  do not call accounts with a date range from index ((4295b7e6))
  *  drop saldo column in account list ((eaf4d0e6))
* **Bookings**  support by_amount and by_date scopes ((29f808eb))

#### Bug Fixes

* **i18n**
  *  add missing translations for en ((6977a37b))
  *  fix translations for booking filter ((950e1853))

3.0.0.beta8
===========
FEATURES:
* feat(bookings): drop two step creation of new bookings
* feat(bookings): use same booking form in all cases

FIXES:
* fix(i18n): fix translations for booking filter
* fix(i18n): add missing translations for en

3.0.0.beta7
===========
FEATURES:
* Support Ruby 2.2

3.0.0.beta6
===========
FEATURES:
* support by_amount and by_date scopes
* add filter form to bookings index

FIXES:
* Correct SCSS Syntax on overview partial

3.0.0.beta5
===========
FIXES:
* Add test-unit as dependency for Ruby 2.2.

3.0.0.beta4
===========
FIXES:
* Factor out form_fields for bookings/form.
* Use bookings form fields for simple_bookings.

CLEANUP:
* Update all gems.
* Adapt travis ruby versions, use container builds.
* Use ruby 2.1.5 by default.

3.0.0.beta3
===========
* Fix width of tag_list input in booking template form.
* Port booking template views from Bookyt.
* Fix order of credit/debit in booking template views.

3.0.0.beta2
===========
* Link to booking reference in account statements if possible.

3.0.0.beta1
===========
* Refactor all usage of deprecated #is_XXX_account? calls.
* Drop unused booking_list_paginate view.
* Add pagination to account booking view.
* Use #accounted_amount in account journals.

3.0.0.beta0
===========
* Fix datepicker to use localized date on postgresql.
* Use common index/list view conventions for accounts.
* Drop seperator line between subject and comment in booking lists.
* Implement table navigation and editing for booking table.

2.0.1
=====
* Use proper bootstrap markup for bookings/new_form.
* Do not use paginated_section as it is will_paginate specific.
* Move carry saldo calculation from view to accounts controller.
* Do not carry saldo for profit accounts in account view.
* Use proper bootstrap markup for bookings/simple_form.
* Drop double pagination.
* Add translation for Account#tag_list attribute.
* Do not only add tab link, but also tab content for attachments in account view.
* Use presence of Account#attachments method instead of Attachment class.
* Re-enable reference input field for Bookings form.

2.0.0
=====
* Add simple_form as dependency and require gem in railtie.
* Only add tab link to attachment in accounts view if Attachment model is defined.
* Add simple_form input types for combobox and date_field.
* Inherit from HasAccountsController, not AuthorizedController.
* Do not try to link to referenced object for bookings in accounts view.
* Only show code field in booking form if Booking supports it.
* Drop hidden field for reference_type in bookings form.
* Drop fiscal year filter from bookings sidebar.
* Add has_scope and anjlab-bootstrap-rails gem dependencies; load has_scope and i18n_rails_helpers in railtie.
* Add bootstrap_helper and has_accounts_helper from Bookyt.
* Add generic view helpers from Bookyt.
* Port layout from Bookyt.
* Port stylesheets from Bookyt.
* Update Gemfile.lock
* Require bootstrap-rails in engine.
* Add images from Bookyt.
* Drop unused icon-text mixins in SASS; breaks inclusion as gem.
* Drop all Bank and BankAccount related controllers and views.
* Cleanup locales.
* Drop print stylesheet for now.
* Add JS assets.
* Switch debit and credit columns.

1.1.2
=====
* Update factories for accounts.
* Add booking_templates controller spec.

1.1.1
=====
Specify dependency on Ruby >= 1.9.3
Fixed specs.

1.1.0
=====
* Use bootstrap markup for submit action in booking form.
* Implement BookingTemplate support.
* Drop size attribute from bookings.amount form field.
* Implement basic simple bookings dialog.

1.0.4
=====
Better default tags for Accounts.

1.0.3
=====
Fix gemspec again.

1.0.2
=====
Fix gemspec.

1.0.1
=====
Implement tagging support for accounts.

1.0.0
=====
Started by factoring out controllers, views, helpers from has_accounts gem.
