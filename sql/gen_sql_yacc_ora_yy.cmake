
file(READ "${IN}" yytmp)

# Comment out sql_mode=DEFAULT %type and %expect directives
string(REPLACE "//%{#ifdef SQL_MODE_DEFAULT_SPECIFIC"
                 "%{#ifdef SQL_MODE_DEFAULT_SPECIFIC"     yytmp "${yytmp}")
string(REPLACE "//#endif %} // SQL_MODE_DEFAULT_SPECIFIC"
                 "#endif %} // SQL_MODE_DEFAULT_SPECIFIC" yytmp "${yytmp}")
# Uncomment sql_mode=ORACLE %type and %expect directives
string(REPLACE   "%{#ifdef SQL_MODE_ORACLE_SPECIFIC"
               "//%{#ifdef SQL_MODE_ORACLE_SPECIFIC"      yytmp "${yytmp}")
string(REPLACE   "#endif %} // SQL_MODE_ORACLE_SPECIFIC"
                "//#endif %} // SQL_MODE_ORACLE_SPECIFIC"  yytmp "${yytmp}")
# Comment out sql_mode=DEFAULT rules
string(REPLACE  "/* Start SQL_MODE_DEFAULT_SPECIFIC */"
                "/* Start SQL_MODE_DEFAULT_SPECIFIC"      yytmp "${yytmp}")
string(REPLACE  "/* End SQL_MODE_DEFAULT_SPECIFIC */"
                   "End SQL_MODE_DEFAULT_SPECIFIC */"     yytmp "${yytmp}")
# Uncomment sql_mode=ORACLE rules
string(REPLACE  "/* Start SQL_MODE_ORACLE_SPECIFIC"
                "/* Start SQL_MODE_ORACLE_SPECIFIC */"    yytmp "${yytmp}")
string(REPLACE     "End SQL_MODE_ORACLE_SPECIFIC */"
                "/* End SQL_MODE_ORACLE_SPECIFIC */"      yytmp "${yytmp}")
file(WRITE "${OUT}" "${yytmp}")