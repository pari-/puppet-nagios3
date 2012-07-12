puppet module for nagios3
=========================

nagios3 is a monitoring system for hosts, services and networks.
This module will help you to setup and configure nagios3.

Basic usage
-----------

To install and configure nagios3:

<pre>
	include nagios3
</pre>

or using the parameterized class with more options:

<pre>
	class {'nagios3':
		enable_check_external_commands => true,
		disable_log_passive_checks     => true,
	}
</pre>

For all options see manifests/init.pp

Caveats
-------

None so far.

Copyright and License
---------------------

Copyright (C) 2012 Patrick Ringl <patrick_@freenet.de>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.


