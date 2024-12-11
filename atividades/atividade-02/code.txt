@startuml

entity "TB_mediatypes" as e01 {
* id:INTEGER
--
Name: NVARCHAR(120)
}

entity "TB_genres" as e02 {
 * id: INTEGER
--
   Name: NVARCHAR(120)
}

entity "TB_playlists" as e03 {
 * id: INTEGER
--
   Name: NVARCHAR(120)
}

entity "TB_playlist_track" as e04 {
 * playlist_id: INTEGER
--
 * track_id: INTEGER
}

entity "TB_tracks" as e05 {
 * id: INTEGER
--
   Name: NVARCHAR(200)
--
   album_id: INTEGER
--
   mediatype_id: INTEGER
--
   genre_id: INTEGER
--
   Composer: NVARCHAR(220)
--
   Milliseconds: INTEGER
--
   Bytes: INTEGER
--
   UnitPrice: NUMERIC
}

entity "TB_artists" as e06 {
  * id: INTEGER
--
    Name: NVARCHAR(120)
}

entity "TB_invoices" as e07 {
  * id: INTEGER
--
    customer_id: INTEGER
--
    InvoiceDate: DATETIME
--
    BillingAdress: NVARCHAR(120)
--
    BillingCity: NVARCHAR(120)
}

entity "TB_invoice_items" as e08 {
  * id: INTEGER
--
    invoice_id: INTEGER
--
    track_id: INTEGER
--
    UnitPrice: NUMERIC
--
    Quantity: INTEGER
}

entity "TB_albums" as e09 {
  * id: INTEGER
--
    Title: NVARCHAR(160)
--
    artist_id: INTEGER
}

entity "TB_customers" as e10 {
  * id: INTEGER
--
    FirstName: NVARCHAR(40)
--
    LastName: NVARCHAR(20)
--
    Company: NVARCHAR(80)
--
    Adress: NVARCHAR(70)
--
    City: NVARCHAR(40)
--
    State: NVARCHAR(40)
--
    Country: NVARCHAR(40)
--
    PostalCode: NVARCHAR(10)
--
    Phone: NVARCHAR(24)
--
    Fax: NVARCHAR(24)
--
    Email: NVARCHAR (60)
--
    supportrep_id: INTEGER
}

entity "TB_employees" as e11 {
  * id: INTEGER
--
    LastName: NVARCHAR(20)
--
    FirstName: NVARCHAR(20)
--
    Title: NVARCHAR(30)
--
    ReportsTo: INTEGER
--
    BirthDate: DATETIME
--
    HireDate: DATETIME
--
    Adress: NVARCHAR(70)
}


e01 ||..o{ e05

e02 |o..o{ e05

e03 ||..o| e04

e04 |o..|| e05

e05 ||..o{ e08
e05 }o..o| e09

e06 ||..o{ e09

e07 ||..o{ e08
e07 }o..|| e10

e10 }o..o| e11

e11 }o..o| e11

@enduml
