SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'TRADITIONAL,ALLOW_INVALID_DATES';

-- Schema Cricket
CREATE SCHEMA IF NOT EXISTS Cricket DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE Cricket;

-- Table Season
CREATE TABLE IF NOT EXISTS Cricket.Season
(
  SeasonId TINYINT(2) NOT NULL,
  Detail VARCHAR(45) NOT NULL,
  PRIMARY KEY (SeasonId)
)
ENGINE = InnoDB;

-- Table Opposition
CREATE TABLE IF NOT EXISTS Cricket.Opposition
(
  OppositionId SMALLINT(4) NOT NULL,
  ParentOppositionId SMALLINT(4) NULL,
  Name VARCHAR(100) NULL,
  PRIMARY KEY (OppositionId)
)
ENGINE = InnoDB;

-- Table Game
CREATE TABLE IF NOT EXISTS Cricket.Game
(
  GameId SMALLINT(4) NOT NULL,
  Date DATETIME NOT NULL,
  SeasonId TINYINT(2) NOT NULL,
  GameNumber TINYINT(2) NOT NULL,
  OppositionId SMALLINT(4) NOT NULL,
  TeamScore SMALLINT(3) NULL,
  OppositionScore SMALLINT(3) NULL,
  Win BIT(1) NOT NULL,
  OppositionPartnershipScore1 SMALLINT(4) NULL,
  OppositionPartnershipScore2 SMALLINT(4) NULL,
  OppositionPartnershipScore3 SMALLINT(4) NULL,
  OppositionPartnershipScore4 SMALLINT(4) NULL,
  TeamPartnershipScore1 SMALLINT(4) NULL,
  TeamPartnershipScore2 SMALLINT(4) NULL,
  TeamPartnershipScore3 SMALLINT(4) NULL,
  TeamPartnershipScore4 SMALLINT(4) NULL,
  PRIMARY KEY (GameId),
  INDEX FK_Game_Season_idx (SeasonId ASC),
  INDEX FK_Game_Opposition_idx (OppositionId ASC),
  CONSTRAINT FK_Game_Season
    FOREIGN KEY (SeasonId)
    REFERENCES Cricket.Season (SeasonId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_Game_Opposition
    FOREIGN KEY (OppositionId)
    REFERENCES Cricket.Opposition (OppositionId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- Table Player
CREATE TABLE IF NOT EXISTS Cricket.Player
(
  PlayerId INT NOT NULL AUTO_INCREMENT,
  Name VARCHAR(100) NOT NULL,
  Ringin BIT(1) NOT NULL,
  PRIMARY KEY (PlayerId)
)
ENGINE = InnoDB;

-- Table PlayerBattingInnings
CREATE TABLE IF NOT EXISTS Cricket.PlayerBattingInnings
(
  PlayerBattingInningsId INT NOT NULL,
  PlayerId INT NOT NULL,
  GameId SMALLINT(4) NOT NULL,
  PartnershipNumber TINYINT(1) NOT NULL,
  BallsFaced TINYINT(2) NOT NULL,
  RunsScored SMALLINT(3) NOT NULL,
  Dismissed TINYINT(2) NOT NULL,
  Singles TINYINT(2) NOT NULL,
  Twos TINYINT(2) NOT NULL,
  Threes TINYINT(2) NOT NULL,
  Fours TINYINT(2) NOT NULL,
  Fives TINYINT(2) NOT NULL,
  Sixes TINYINT(2) NOT NULL,
  Sevens TINYINT(2) NOT NULL,
  Eights TINYINT(2) NOT NULL,
  INDEX FK_PlayerBattingInnings_Game_idx (GameId ASC),
  PRIMARY KEY (PlayerBattingInningsId),
  CONSTRAINT FK_PlayerBattingInnings_Player
    FOREIGN KEY (PlayerId)
    REFERENCES Cricket.Player (PlayerId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_PlayerBattingInnings_Game
    FOREIGN KEY (GameId)
    REFERENCES Cricket.Game (GameId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- Table PlayerOverBowled
CREATE TABLE IF NOT EXISTS Cricket.PlayerOverBowled
(
  PlayerOverBowledId INT NOT NULL,
  PlayerId INT NOT NULL,
  GameId SMALLINT(4) NOT NULL,
  OverNumber TINYINT(3) NOT NULL,
  RunsConceded TINYINT(3) NOT NULL,
  Wickets TINYINT(3) NOT NULL,
  INDEX FK_PlayerOverBowled_Game_idx (GameId ASC),
  PRIMARY KEY (PlayerOverBowledId),
  CONSTRAINT FK_PlayerOverBowledId_Player
    FOREIGN KEY (PlayerId)
    REFERENCES Cricket.Player (PlayerId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT FK_PlayerOverBowledId_Game
    FOREIGN KEY (GameId)
    REFERENCES Cricket.Game (GameId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

-- Table TeamInnings
CREATE TABLE IF NOT EXISTS Cricket.TeamInnings
(
  Breakdown VARCHAR(150) NULL,
  GameId SMALLINT(4) NULL,
  INDEX FK_TeamInnings_Game_idx (GameId ASC),
  CONSTRAINT FK_TeamInnings_Game
    FOREIGN KEY (GameId)
    REFERENCES Cricket.Game (GameId)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
)
ENGINE = InnoDB;

SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;
