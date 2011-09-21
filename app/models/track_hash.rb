class TrackHash < Hashie::Trash
  property :guid, :from => "Track_ID"
  property :name, :from => "Name"
  property :artist, :from => "Artist"
  property :composer, :from => "Composer"
  property :album, :from => "Album"
  property :genre, :from => 'Genre'
  property :kind, :from => 'Kind'
  property :size, :from => 'Size'
  property :duration, :from => "Total_Time"
  property :track_number, :from => "Track_Number"
  property :track_count, :from => 'Track_Count'
  property :year, :from => 'Year'
  property :updated_at, :from => 'Date_Modified'
  property :added_at, :from => "Date_Added"
  property :bit_rate, :from => "Bit_Rate"
  property :sample_rate, :from => 'Sample_Rate'
  property :persistent_id, :from => 'Persistent_ID'
  property :track_type, :from => 'Track_Type'
  property :location, :from => 'Location'
  property :file_folder_count, :from => "File_Folder_Count"
  property :library_folder_count, :from => 'Library_Folder_Count'
  property :sort_album, :from => "Sort_Album"
  property :comments, :from => "Comments"
  property :artwork_count, :from => 'Artwork_Count'
  property :album_artist, :from => 'Album_Artist'
  property :disc_number, :from => 'Disc_Number'
  property :disc_count, :from => 'Disc_Count'
  property :release_date, :from => 'Release_Date'
  property :purchased, :from => 'Purchased'
  property :sort_name, :from => 'Sort_Name'
  property :play_count, :from => 'Play_Count'
  property :play_date, :from => 'Play_Date'
  property :play_date_utc, :from => 'Play_Date_UTC'
  property :part_of_gapless_album, :from => 'Part_Of_Gapless_Album'
  property :compilation, :from => 'Compilation'

end