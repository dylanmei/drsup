set nocount on

-- Video Thumbnail
update tbl$Videos set tx_thumb = null
	where charindex('default', isnull(tx_thumb, '')) <> 0

update tbl$Videos set tx_thumb = reverse(substring(reverse(tx_thumb), 0, charindex('\', reverse(tx_thumb), 1)))
	where tx_thumb is not null and charindex('\', tx_thumb) <> 0

-- Album Artwork
update tbl$Music$Album set tx_AlbumArtwork = null
	where charindex('default', isnull(tx_AlbumArtwork, '')) <> 0

update tbl$Music$Album set tx_AlbumArtwork = reverse(substring(reverse(tx_AlbumArtwork), 0, charindex('\', reverse(tx_AlbumArtwork), 1)))
	where tx_AlbumArtwork is not null and charindex('\', tx_AlbumArtwork) <> 0

-- Track MP3
update tbl$Music$Track set tx_MP3Location = reverse(substring(reverse(tx_MP3Location), 0, charindex('\', reverse(tx_MP3Location), 1)))
	where tx_MP3Location is not null and charindex('\', tx_MP3Location) <> 0

-- Photo IMG
update tbl$Pictures set tx_IMGLocation = null
	where charindex('default', isnull(tx_IMGLocation, '')) <> 0

update tbl$Pictures set tx_IMGLocation = reverse(substring(reverse(tx_IMGLocation), 0, charindex('\', reverse(tx_IMGLocation), 1)))
	where tx_IMGLocation is not null and charindex('\', tx_IMGLocation) <> 0

-- Photo Album Picture
update tbl$Pictures$Album set fo_MainPhoto = null
	where charindex('default', isnull(fo_MainPhoto, '')) <> 0

update tbl$Pictures$Album set fo_MainPhoto = reverse(substring(reverse(fo_MainPhoto), 0, charindex('\', reverse(fo_MainPhoto), 1)))
	where fo_MainPhoto is not null and charindex('\', fo_MainPhoto) <> 0

-- Member Picture
update tbl$Members set Picture = null
	where charindex('default', isnull(Picture, '')) <> 0

update tbl$Members set Picture = reverse(substring(reverse(Picture), 0, charindex('\', reverse(Picture), 1)))
	where Picture is not null and charindex('\', Picture) <> 0
	
	




