# Downloads every photo used on the site into assets\img so the site runs fully offline.
# Double-click DOWNLOAD-IMAGES.bat (or run: powershell -ExecutionPolicy Bypass -File download-images.ps1)
$ErrorActionPreference = 'Continue'
$dir = Join-Path $PSScriptRoot 'assets\img'
New-Item -ItemType Directory -Force -Path $dir | Out-Null
$ua = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) site-image-cache'
$imgs = @(
  @('bx-el-sunset.webp','https://lh3.googleusercontent.com/gps-cs-s/AHRPTWlq9Jw9xCry3EOyfLjYY8paaHnh4YLBD_ghIAkv19EuVDOK1flXWTLEvnh5EVA83p63HG_eKsvAuNsf7avcMMH_evX0KGT_4fHKr45iBWUH490L9Weac1TvgnjcPxgfa30SsB_Cvg=s1360-w1360-h1020-rw'),
  @('bx-el-sunset-sq.webp','https://lh3.googleusercontent.com/grass-cs/ACvplmM-q1_6AOaWEXCNEzgjqgOXrgTMHCRw5DXpB5m866t3cL_r-CSrEWZvyJzMC0O2luYi4vVURnlFfcd-kvOBlGIVsPzPJvDWUipsRNPMvEu2j_pXpwC5NJG-m7n12enBo4GmlsD9yg=w326-h312-n-k-no'),
  @('bx-street-towers.webp','https://lh3.googleusercontent.com/gps-cs-s/AHRPTWlrk5R3sGeC9SrhaSmDsIp_Rjxo0P-ycx9XhsNYDvBsSfkfTdNDUkh4_E2i_zsFVxh1f0UyaXufHB8xvUJg2lGYLVTs0dNr_wGdq9ass4Bxj3Kv8H5UKLvtdnsGpHbhQKttHZk3=s1360-w1360-h1020-rw'),
  @('bx-skyline-pano.webp','https://lh3.googleusercontent.com/gps-cs-s/AHRPTWm7ovZiTZ6a54uUxYLzYjsT2xw7mUrQJ9wRGSE_DzPAC1DGGBMirutZhtnZdRstwRhHLUKY3mOtWU_HxdOVX3e12yTx5gsFWl2XVzgjV-giSDad5z47hWDvB53wI8HDVrvNWBNRAQ=s1360-w1360-h1020-rw'),
  @('grand-concourse-2026.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Grand_Concourse_Mar_2026_23.jpg/1920px-Grand_Concourse_Mar_2026_23.jpg'),
  @('grand-concourse-2022.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Grand_Concourse%2C_Bronx_-_20220616.jpg/1920px-Grand_Concourse%2C_Bronx_-_20220616.jpg'),
  @('grand-concourse-pano.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Grand_Concourse_panorama.jpg/1920px-Grand_Concourse_panorama.jpg'),
  @('arthur-ave.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Arthur_Avenue_between_184th_and_186th_Street_in_the_Bronx%2C_New_York_City_001_crop.jpg/1920px-Arthur_Avenue_between_184th_and_186th_Street_in_the_Bronx%2C_New_York_City_001_crop.jpg'),
  @('arthur-ave-marios.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/0/07/Mario%27s_Restaurant_on_Arthur_Avenue_%28Bronx%2C_New_York%29_001.jpg/1920px-Mario%27s_Restaurant_on_Arthur_Avenue_%28Bronx%2C_New_York%29_001.jpg'),
  @('arthur-ave-fair.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Bronx_Street_Fair%2C_187th_and_Arthur_Avenue.JPG/1920px-Bronx_Street_Fair%2C_187th_and_Arthur_Avenue.JPG'),
  @('yankee-stadium.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/5/5b/Yankee-stadium-2023.jpg/1920px-Yankee-stadium-2023.jpg'),
  @('jerome-el.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Jerome_Avenue_elevated_line.jpg/1920px-Jerome_Avenue_elevated_line.jpg'),
  @('orchard-beach.jpg','https://upload.wikimedia.org/wikipedia/commons/9/9d/Orchard_Beach_-_Pelham_Bay_Park_-_The_Bronx.jpg'),
  @('fordham-road.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2c/Fordham_Road_Bronx_Park_td_%282018-09-29%29_14.jpg/1920px-Fordham_Road_Bronx_Park_td_%282018-09-29%29_14.jpg'),
  @('city-island-skyline.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Midtown_Manhattan_skyline_as_seen_from_Belden_Point%2C_City_Island%2C_Bronx_-_20220616.jpg/1920px-Midtown_Manhattan_skyline_as_seen_from_Belden_Point%2C_City_Island%2C_Bronx_-_20220616.jpg'),
  @('port-morris-mural.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/Port_Morris_by_TATS_CRU.jpg/1920px-Port_Morris_by_TATS_CRU.jpg'),
  @('third-ave-bridge.jpg','https://upload.wikimedia.org/wikipedia/commons/7/71/3rd_Ave_Br_-_Port_Morris%2C_The_Bronx_NY.jpg'),
  @('nybg-conservatory.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/NYBG_Conservatory_NY1.jpg/1920px-NYBG_Conservatory_NY1.jpg'),
  @('e149th-st.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/149th_Street_%40_St._Ann%27s_Avenue%2C_looking_west%2C_2024-06-16%2C_Mott_Haven%2C_South_Bronx%2C_New_York_City.jpg/1920px-149th_Street_%40_St._Ann%27s_Avenue%2C_looking_west%2C_2024-06-16%2C_Mott_Haven%2C_South_Bronx%2C_New_York_City.jpg'),
  @('hub-3rd-149.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/0/01/3rd._Avenue_and_149th._Street%2C_The_Bronx%2C_New_York%2C_12_Feb._2008_%282260804351%29.jpg/1920px-3rd._Avenue_and_149th._Street%2C_The_Bronx%2C_New_York%2C_12_Feb._2008_%282260804351%29.jpg'),
  @('hub-3av-149-vc.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/3_Av_149_St_vc.jpg/1920px-3_Av_149_St_vc.jpg'),
  @('hunts-point-market.jpg','https://upload.wikimedia.org/wikipedia/commons/c/c9/Hunts_Point_Market_2008ds.jpg'),
  @('bronx-river-greenway.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d0/Allerton_Bronx_River_Greenway_03.jpg/1920px-Allerton_Bronx_River_Greenway_03.jpg'),
  @('kingsbridge-armory.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Kingsbridge_Armory_%28Bronx%29_IMG_3791_HLG.jpg/1920px-Kingsbridge_Armory_%28Bronx%29_IMG_3791_HLG.jpg'),
  @('crotona-park.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Crotona_Park_Charlotte_Street_BBQ_area_HDR_2022_jeh.jpg/1920px-Crotona_Park_Charlotte_Street_BBQ_area_HDR_2022_jeh.jpg'),
  @('westchester-sq-station.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Westchester_Square%E2%80%93East_Tremont_Avenue_Station_-_54293120532.jpg/1920px-Westchester_Square%E2%80%93East_Tremont_Avenue_Station_-_54293120532.jpg'),
  @('wave-hill.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Wave_Hill_-_20220616_-_03_-_The_Winding_Path.jpg/1920px-Wave_Hill_-_20220616_-_03_-_The_Winding_Path.jpg'),
  @('city-island-marina.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/CI_Marina_%26_Throgs_Neck_Br_jeh.jpg/1920px-CI_Marina_%26_Throgs_Neck_Br_jeh.jpg'),
  @('poe-cottage.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Edgar-allen-poe-cottage.JPG/1920px-Edgar-allen-poe-cottage.JPG'),
  @('bronx-courthouse.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Bronx_Courthouse_from_Joyce_Kilmer_Park.jpg/1920px-Bronx_Courthouse_from_Joyce_Kilmer_Park.jpg'),
  @('st-marys-park.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/St._Mary%27s_Park%2C_June_16_2024%2C_Mott_Haven%2C_Bronx%2C_New_York_City_01.jpg/1920px-St._Mary%27s_Park%2C_June_16_2024%2C_Mott_Haven%2C_Bronx%2C_New_York_City_01.jpg'),
  @('pelham-bay-park.jpg','https://upload.wikimedia.org/wikipedia/commons/a/ae/Now_part_of_Pelham_Bay_Park%2C_the_Bronx_%2853360743025%29.jpg'),
  @('kingsbridge-4train.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/From_the_4_Train_td_%282019-03-29%29_08_-_Kingsbridge_Road.jpg/1920px-From_the_4_Train_td_%282019-03-29%29_08_-_Kingsbridge_Road.jpg'),
  @('westchester-ave-station.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Westchester_Avenue_Station_Bronx_01.JPG/1920px-Westchester_Avenue_Station_Bronx_01.JPG'),
  @('bronx-zoo.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Bronx_Zoo_-_New_York_-_USA_-_panoramio_%281%29.jpg/1920px-Bronx_Zoo_-_New_York_-_USA_-_panoramio_%281%29.jpg'),
  @('hunts-point-ave.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Hunts_Point_Avenue_%2834432169234%29.jpg/1920px-Hunts_Point_Avenue_%2834432169234%29.jpg'),
  @('parkchester.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Parkchester%2C_Bronx_%2835145740091%29.jpg/1920px-Parkchester%2C_Bronx_%2835145740091%29.jpg'),
  @('castle-hill.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Soundview_-_Clason_Point_-_Castle_Hill%2C_Bronx_%2834432171054%29.jpg/1920px-Soundview_-_Clason_Point_-_Castle_Hill%2C_Bronx_%2834432171054%29.jpg'),
  @('city-island-hart.jpg','https://upload.wikimedia.org/wikipedia/commons/thumb/f/f7/City_Island_and_Hart_Island%2C_Bronx_NY.jpg/1920px-City_Island_and_Hart_Island%2C_Bronx_NY.jpg')
)
foreach ($i in $imgs) {
  $out = Join-Path $dir $i[0]
  if (Test-Path $out) { Write-Host ('skip  ' + $i[0]); continue }
  try { Invoke-WebRequest -Uri $i[1] -OutFile $out -UserAgent $ua -UseBasicParsing; Write-Host ('saved ' + $i[0]) }
  catch { Write-Host ('FAILED ' + $i[0] + ' - the site will keep using the online copy') }
  Start-Sleep -Milliseconds 400
}
Write-Host 'Done. Photos are in assets\img.'
