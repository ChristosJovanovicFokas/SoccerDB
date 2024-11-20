SELECT medicalrecords.PlayerID, soccerplayer.player_name, Description 
from medicalrecords
JOIN soccerplayer ON medicalrecords.PlayerID = soccerplayer.player_id;

SELECT soccergames.GameID, stadium.stadium_name
FROM soccergames
JOIN stadium ON soccergames.StadiumID = stadium.stadium_id
WHERE soccergames.GameID = 2;

SELECT soccergames.GameID, club.club_name
FROM soccergames
JOIN club ON soccergames.ClubID = club.club_id
WHERE soccergames.GameID = 2;

SELECT soccergames.GameID, referees.Name
FROM SoccerGames
JOIN referees ON SoccerGames.RefereeID = referees.RefereeID
WHERE soccergames.GameDate = '2022-05-28';

UPDATE soccerplayer
SET player_name = 'Neymar da Silva Santos Jr.'
WHERE player_id = 3;



