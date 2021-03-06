create table ANSWERED_QUESTIONS (
        ID bigint,
        COMMENT varchar(255),
        QUESTION_ID bigint,
        SURVEY_ID bigint,
        NUMBER integer,
        primary key (ID)
    );

create table ANSWERED_QUESTIONS_ANSWERS (
        ID bigint,
        SELECTED boolean,
        ANSWER_TEMPLATE_ID bigint,
        ANSWERED_QUESTION_ID bigint,
        NUMBER integer,
        primary key (ID)
    );

create table ANSWER_EVALUATIONS (
        ID bigint,
        ANSWERED_QUESTION_ID bigint not null,
        RESEARCH_ID bigint not null,
        primary key (ID)
    );

create table ANSWER_TEMPLATES (
        ID bigint,
        DISALLOWS_OTHER_ANSWERS boolean not null,
        REQUIRES_COMMENT boolean not null,
        TEXT varchar(255),
        QUESTION_ID bigint,
        NUMBER integer,
        primary key (ID)
    );

create table ASSIGNED_TAGS (
        ANSWER_EVALUATION_ID bigint not null,
        TAG varchar(255)
    );

create table EVALUATOR_DEFINED_TAGS (
        QUESTION_EVALUATION_ID bigint not null,
        TAG varchar(255)
    );

create table FILLED_SURVEYS (
        ID bigint,
        FINISH_DATE timestamp,
        START_DATE timestamp,
        PUBL_TEMPLATE_ID bigint not null,
        USER_ID bigint not null,
        primary key (ID)
    );

create table QUESTION_EVALUATIONS (
        ID bigint,
        COMMENT varchar(2048),
        QUESTION_TEMPLATE_ID bigint not null,
        RESEARCH_ID bigint,
        NUMBER integer,
        primary key (ID)
    );

create table QUESTION_TEMPLATES (
        ID bigint,
        HTML_TEXT varchar(255),
        STYLE varchar(255),
        TEXT varchar(255),
        QUESTION_TYPE varchar(255) not null,
        TEMPLATE bigint not null,
        "number" integer,
        primary key (ID)
    );

create table RESEARCHES (
        ID bigint,
        CREATION_DATE timestamp,
        RESEARCH_NAME varchar(255),
        SURVEY_TEMPLATE_ID bigint not null,
        primary key (ID)
    );
    
create table RESEARCHES_PUBLICATIONS (
        PUBLICATION_ID bigint not null,
        RESEARCH_ID bigint not null
    );

create table SEARCH_PHRASES (
        QUESTION_EVALUATION_ID bigint not null,
        SEARCH_PHRASE varchar(255)
    );

create table STUDENT_GROUPS (
        ID bigint,
        GROUP_NAME varchar(255),
        ALLOW_STUDENT_SIGNUP boolean not null,
        primary key (ID)
    );

create table STUDENT_GROUPS_MEMBERS (
        GROUP_ID bigint not null,
        GROUP_ROLE varchar(255),
        MEMBER_ID bigint not null
    );

create table SURVEY_PUBLICATIONS (
        id bigint,
        ENABLED_FROM timestamp,
        ENABLED_TO timestamp,
        GROUP_ID bigint not null,
        TEMPLATE_ID bigint not null,
        primary key (id)
    );

create table SURVEY_TEMPLATES (
        ID bigint,
        CREATION_DATE timestamp,
        TITLE varchar(255),
        DESCRIPTION varchar(1024),
        USER_ID bigint not null,
        primary key (ID)
    );

create table USER_ACCOUNTS (
        ID bigint,
        EMAIL varchar(255) not null,
        USERNAME varchar(255),
        PASSWORD varchar(255),
        primary key (ID),
        unique (EMAIL)
    );

create table USER_ACCOUNTS_PRIVILEGES (
        USER_ACCOUNT bigint not null,
        PRIVILEGE varchar(255)
    );

alter table ANSWERED_QUESTIONS
        add constraint FKF226E04B8B1B6C01
        foreign key (SURVEY_ID)
        references FILLED_SURVEYS;

alter table ANSWERED_QUESTIONS
        add constraint FKF226E04BD18C2899
        foreign key (QUESTION_ID)
        references QUESTION_TEMPLATES;

alter table ANSWERED_QUESTIONS_ANSWERS
        add constraint FK422C5061EAF8399C
        foreign key (ANSWER_TEMPLATE_ID)
        references ANSWER_TEMPLATES;

alter table ANSWERED_QUESTIONS_ANSWERS
        add constraint FK422C5061E8DE199A
        foreign key (ANSWERED_QUESTION_ID)
        references ANSWERED_QUESTIONS;

alter table ANSWER_EVALUATIONS
        add constraint FKFCFC5996E8DE199A
        foreign key (ANSWERED_QUESTION_ID)
        references ANSWERED_QUESTIONS;

alter table ANSWER_EVALUATIONS
        add constraint FKFCFC5996E9B3ADF
        foreign key (RESEARCH_ID)
        references RESEARCHES;

alter table ANSWER_TEMPLATES
        add constraint FK77EDEBD8D18C2899
        foreign key (QUESTION_ID)
        references QUESTION_TEMPLATES;

alter table ASSIGNED_TAGS
        add constraint FK7E0457EAEEA229DC
        foreign key (ANSWER_EVALUATION_ID)
        references ANSWER_EVALUATIONS
        on delete cascade;

alter table EVALUATOR_DEFINED_TAGS
        add constraint FK586A06DFFF933CEC
        foreign key (QUESTION_EVALUATION_ID)
        references QUESTION_EVALUATIONS
        on delete cascade;

alter table FILLED_SURVEYS
        add constraint FKC589965C8D3E90DD
        foreign key (PUBL_TEMPLATE_ID)
        references SURVEY_PUBLICATIONS;

alter table FILLED_SURVEYS
        add constraint FKC589965C6278616F
        foreign key (USER_ID)
        references USER_ACCOUNTS;

alter table QUESTION_EVALUATIONS
        add constraint FK468C55BE6032D0AC
        foreign key (QUESTION_TEMPLATE_ID)
        references QUESTION_TEMPLATES;

alter table QUESTION_EVALUATIONS
        add constraint FK468C55BEE9B3ADF
        foreign key (RESEARCH_ID)
        references RESEARCHES;
        
alter table QUESTION_TEMPLATES
        add constraint FK8A1ED2009F9F85B3
        foreign key (TEMPLATE)
        references SURVEY_TEMPLATES;
        
alter table RESEARCHES
        add constraint FK9995BF89147D22D4
        foreign key (SURVEY_TEMPLATE_ID)
        references SURVEY_TEMPLATES;
        
alter table RESEARCHES_PUBLICATIONS
        add constraint FKFE207CBD21EB44AE
        foreign key (PUBLICATION_ID)
        references RESEARCHES;
        
alter table RESEARCHES_PUBLICATIONS
        add constraint FKFE207CBD8A5F8F4C
        foreign key (RESEARCH_ID)
        references SURVEY_PUBLICATIONS;
        
alter table SEARCH_PHRASES
        add constraint FK600E9D23FF933CEC
        foreign key (QUESTION_EVALUATION_ID)
        references QUESTION_EVALUATIONS;
        
alter table STUDENT_GROUPS_MEMBERS
        add constraint FK6830BC32BB3E1C40
        foreign key (MEMBER_ID)
        references USER_ACCOUNTS;
        
alter table STUDENT_GROUPS_MEMBERS
        add constraint FK6830BC323C091064
        foreign key (GROUP_ID)
        references STUDENT_GROUPS;
        
alter table SURVEY_PUBLICATIONS
        add constraint FK92CD1C8C3C091064
        foreign key (GROUP_ID)
        references STUDENT_GROUPS;
        
alter table SURVEY_PUBLICATIONS
        add constraint FK92CD1C8C57DF5439
        foreign key (TEMPLATE_ID)
        references SURVEY_TEMPLATES;
        
alter table SURVEY_TEMPLATES
        add constraint FKB0F80746278616F
        foreign key (USER_ID)
        references USER_ACCOUNTS;
        
alter table USER_ACCOUNTS_PRIVILEGES
        add constraint FKC1CBC7679C9B0076
        foreign key (USER_ACCOUNT)
        references USER_ACCOUNTS;

CREATE VIEW PUBLISHED_SURVEY_TEMPLATE_DTOS AS
SELECT
        sp.ID AS ID,
        st.ID AS TEMPLATE_ID,
        st.TITLE AS TITLE,
        sg.GROUP_NAME AS GROUP_NAME,
        sg.ID AS GROUP_ID,
        sp.ENABLED_FROM AS ENABLED_FROM,
        sp.ENABLED_TO AS ENABLED_TO
FROM
        SURVEY_PUBLICATIONS sp
LEFT JOIN
        SURVEY_TEMPLATES st ON sp.TEMPLATE_ID = st.ID
LEFT JOIN
        STUDENT_GROUPS sg ON sg.ID = sp.GROUP_ID;

CREATE VIEW SURVEY_DTOS AS
SELECT
   fs.ID AS ID,
   sp.ID AS PUBLICATION_ID,
   fs.START_DATE as START_DATE,
   fs.FINISH_DATE as FINISH_DATE,
   sg.ID as GROUP_ID,
   sg.GROUP_NAME as GROUP_NAME,
   st.ID AS TEMPLATE_ID,
   st.TITLE AS TEMPLATE_NAME,
   st.DESCRIPTION AS TEMPLATE_DESCRIPTION,
   ua.ID AS USER_ID,
   ua.USERNAME AS USER_NAME
FROM
    FILLED_SURVEYS fs,
    SURVEY_PUBLICATIONS sp,
    STUDENT_GROUPS sg,
    SURVEY_TEMPLATES st,
    USER_ACCOUNTS ua
WHERE 
    fs.PUBL_TEMPLATE_ID = sp.ID
AND
    sp.TEMPLATE_ID = st.ID
AND
    sg.ID = sp.GROUP_ID
AND
    fs.USER_ID = ua.ID;
    
CREATE VIEW SURVEY_QUESTION_DTOS AS
SELECT
    aq.ID as ID,
    aq.COMMENT AS COMMENT,
    qt.TEXT AS TEXT,
    qt.HTML_TEXT AS HTML_TEXT,
    aq.NUMBER AS NUMBER,
    qt.STYLE AS STYLE,
    aq.SURVEY_ID AS SURVEY_ID,
    qt.QUESTION_TYPE AS QUESTION_TYPE
FROM
    ANSWERED_QUESTIONS aq,
    QUESTION_TEMPLATES qt
WHERE aq.QUESTION_ID = qt.ID;

CREATE VIEW SURVEY_QUESTION_ANSWER_DTOS AS
SELECT
    aq.ID AS ID,
    at.NUMBER AS NUMBER,
    at.TEXT AS TEXT,
    at.REQUIRES_COMMENT AS REQUIRES_COMMENT,
    at.DISALLOWS_OTHER_ANSWERS AS DISALLOWS_OTHER_ANSWERS,
    aq.SELECTED AS SELECTED,
    aq.ANSWERED_QUESTION_ID as ANSWERED_QUESTION_ID
FROM
    ANSWER_TEMPLATES at,
    ANSWERED_QUESTIONS_ANSWERS aq
WHERE
    aq.ANSWER_TEMPLATE_ID = at.ID;

CREATE VIEW RESEARCHES_FILLED_SURVEYS AS
SELECT
    RPS.RESEARCH_ID AS RESEARCH_ID,
    FS.ID AS FILLED_SURVEY_ID
FROM 
    RESEARCHES_PUBLICATIONS RPS
LEFT JOIN FILLED_SURVEYS FS ON FS.PUBL_TEMPLATE_ID = RPS.PUBLICATION_ID
WHERE 
    (FS.FINISH_DATE IS NOT NULL);

CREATE VIEW EVALUATION_ACTIVITIES AS
            SELECT
                ST.ID AS ACTIVITY_ID,
                ST.TITLE AS ACTIVITY_DESCRIPTION,
                'SURVEY_TEMPLATE' AS ACTIVITY_TYPE,
                ST.CREATION_DATE AS CREATION_DATE,
                ST.USER_ID AS USER_ID
            FROM SURVEY_TEMPLATES ST
        UNION ALL
            SELECT
                RS.ID AS ACTIVITY_ID,
                RS.RESEARCH_NAME AS ACTIVITY_DESCRIPTION,
                'RESEARCH' AS ACTIVITY_TYPE,
                RS.CREATION_DATE AS CREATION_DATE,
                RST.USER_ID AS USER_ID
            FROM RESEARCHES RS
            INNER JOIN SURVEY_TEMPLATES RST ON RS.SURVEY_TEMPLATE_ID = RST.ID;
            
CREATE SEQUENCE hibernate_sequence
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 119887
  CACHE 1;

CREATE VIEW FILLED_SURVEYS_PER_STUDENT AS
    SELECT
        FS.USER_ID AS STUDENT_ID,
        SP.GROUP_ID AS GROUP_ID,
        COUNT(FS.ID) AS SURVEYS_COUNT
    FROM
        FILLED_SURVEYS FS,
        SURVEY_PUBLICATIONS SP
    WHERE
        SP.ID = FS.PUBL_TEMPLATE_ID
    AND
        FS.FINISH_DATE IS NOT NULL
    GROUP BY
        FS.USER_ID, SP.GROUP_ID;

-- shows published surveys count for all groups, whether they've got any survey template published or not
CREATE VIEW PUBLISHED_SURVEYS_COUNT_BY_GROUP AS
            SELECT
                SP.GROUP_ID AS GROUP_ID,
                COUNT(SP.ID) AS PUBLISHED_SURVEYS_COUNT
            FROM
                SURVEY_PUBLICATIONS SP
            GROUP BY SP.GROUP_ID
        UNION ALL
            SELECT
                DISTINCT SG.ID AS GROUP_ID,
                0 AS PUBLISHED_SURVEYS_COUNT
            FROM
                STUDENT_GROUPS SG
            LEFT JOIN SURVEY_PUBLICATIONS SP ON SP.GROUP_ID = SG.ID
            WHERE SP.ID IS NULL;

CREATE VIEW UNFILLED_SURVEYS_PER_STUDENT AS
    SELECT
        FS.STUDENT_ID AS STUDENT_ID,
        FS.GROUP_ID AS GROUP_ID,
        PS.PUBLISHED_SURVEYS_COUNT - FS.SURVEYS_COUNT AS UNFILLED_SURVEYS
    FROM FILLED_SURVEYS_PER_STUDENT FS
    LEFT JOIN PUBLISHED_SURVEYS_COUNT_BY_GROUP PS ON FS.GROUP_ID = PS.GROUP_ID;
 
CREATE TABLE DBVERSION ( dbversion integer );
INSERT INTO DBVERSION (dbversion) VALUES (1);

