<h1>"Changelog" </h1>

<p>
Ver 0.1 = Attempt to setup with MariaDB got shut down by a retarded handling of foreign keys in the system. 
Ver 0.2 = Installing driver, setting up postgres + pgadmin. Tried lots of different PGSQL PDO script, but none worked 
Ver 0.3 = Simple Postgres setup works for the initial Signup. Unfortunately it errors afterwards, since the ID doesnt auto increment.

TO DO:
To fix the above error, we have to replace BIGINT(11) with a SERIAL for all the ID's.
But then we have to fix the foreign keys as well, since they have to be the same type and value ()

</p>
