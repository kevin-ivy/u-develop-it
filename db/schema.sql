DROP TABLE IF EXISTS parties;
DROP TABLE IF EXISTS candidates;
DROP TABLE IF EXISTS voters;
DROP TABLE IF EXISTS votes;

CREATE TABLE candidates (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    industry_connected BOOLEAN NOT NULL,
    party_id INTEGER UNSIGNED,
    CONSTRAINT fk_party FOREIGN KEY (party_id) REFERENCES parties(id) ON DELETE SET NULL
);

CREATE TABLE parties (
    id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE voters (
    id INTEGER PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    email VARCHAR(50) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE votes (
    id integer primary key,
    voter_id integer unsigned not null,
    candidate_id integer unsigned not null,
    created_at datetime default current_timestamp,
    constraint uc_voter unique (voter_id),
    constraint fk_voter foreign key (voter_id) references voters(id) on delete cascade,
    constraint fk_candidate foreign key (candidate_id) references candidates(id) on delete cascade
);