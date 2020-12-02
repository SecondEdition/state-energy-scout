================================================
-- Some example queries
================================================

-- Energy Consumed 
SELECT "energyConsumed" FROM public."Consumption";


-- Energy Consumed and Produced, by year. 
SELECT (SUM("energyConsumed")) AS "Energy Consumed", (SUM("energyProduced")) AS "Energy Produced" 
FROM public."Consumption", public."Production"
WHERE public."Consumption"."year" = public."Production"."year"
GROUP BY public."Consumption"."year";


-- Difference in energy produced and consumed using "JOIN ... ON"
SELECT public."Consumption"."year" AS diffyear, public."Consumption"."stateCode" AS stateco, (SUM("energyProduced") - SUM("energyConsumed")) AS difference 
FROM public."Consumption"
       INNER JOIN public."Production"
               ON public."Consumption"."year" = public."Production"."year"
GROUP BY public."Consumption"."year", public."Consumption"."stateCode"
ORDER BY public."Consumption"."year";


-- Difference in energy produced and consumed using "WHERE"
SELECT public."Consumption"."year" AS diffyear, public."States"."stateName" AS state, (SUM("energyProduced") - SUM("energyConsumed")) AS difference 
FROM public."Consumption", public."Production", public."States"
WHERE public."States"."stateCode" = public."Consumption"."stateCode" AND public."Consumption"."year" = public."Production"."year"
GROUP BY public."Consumption"."year", public."States"."stateName"
ORDER BY public."Consumption"."year";

--Top 5 energy consumers
SELECT SUM("energyConsumed") AS "Energy produced", "stateName" AS "State"
FROM public."Consumption", public."States"
WHERE public."States"."stateCode" = public."Consumption"."stateCode"
GROUP BY public."States"."stateName"
ORDER BY SUM("energyConsumed") DESC
LIMIT 5;

