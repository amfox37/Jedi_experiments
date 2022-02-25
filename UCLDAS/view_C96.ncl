begin

  res                       = True              ; Plot mods desired.
  res@gsnMaximize           = True              ; Maximize plot
  res@gsnAddCyclic          = False             ; don't add a longitude cyclic point
  res@cnFillOn              = True              ; color plot desired
  res@cnFillOpacityF        = 0.6               ; apply a little opacity so we can see mesh lines better
  res@cnFillMode            = "CellFill"
  res@cnFillPalette         = "BlWhRe"
  res@cnLinesOn             = False             ; turn off contour lines
  res@cnLineLabelsOn        = False             ; turn off contour labels
  res@tiMainFontHeightF     = 0.017
  res@pmTitleZone           = 4                 ; move title down
  res@mpFillOn              = False             ; turn off map fill
  res@pmTickMarkDisplayMode = "Always"          ; nicer map tickmark labels
  res@mpDataBaseVersion     = "LowRes"       ; better map outlines
  res@mpOutlineBoundarySets = "Geophysical"
  res@mpOutlineOn           = True
  res@mpNationalLineThicknessF    = 2.0      ; for better looking images
  res@mpGeophysicalLineThicknessF = 2.0
  res@mpCountyLineThicknessF      = 2.0
  res@mpProvincialLineThicknessF  = 2.0
  res@gsnRightString        = ""
  res@gsnLeftString         = ""
  res@lbLabelBarOn          = True             ; Will turn on in panel

  if(True) then
    wks = gsn_open_wks("x11","blah") 
  else
    wks = gsn_open_wks("png","blah") 
  end if

  infile = addfile("/glade/scratch/barlage/fv3/ufs-land/C96/ufs-land_C96_da_corners.nc","r")
  
  lat  = infile->latitude
  lon  = infile->longitude
  latc = infile->latitude_corners
  lonc = infile->longitude_corners

  res@sfXArray      := lon               ; necessary for plotting MPAS
  res@sfYArray      := lat
  res@sfYCellBounds := latc     ; necessary for CellFill 
  res@sfXCellBounds := lonc

;  c96_filename = "/gpfs/fs1/scratch/barlage/gswp3/elevation/C96_GSWP3_elevation_cru.nc"
;  infile = addfile(c96_filename,"r")
;  invar = infile->elevation_difference

;  c96_filename = "/gpfs/fs1/scratch/barlage/gswp3/forcing/C96/uncompress/C96_GSWP3_forcing_2000-01.nc"
;  c96_filename = "blah2.nc"
  c96_filename = "./ufs_land_output.2000-01-01_18-00-00.nc"
  infile = addfile(c96_filename,"r")
  invar = infile->tskin(0,:)
;  invar = infile->precipitation_bilinear(0,:)
;  invar = infile->precipitation_conserve(0,:)
;  invar = invar * 3600 * 3
;  invar = mask(invar,invar.gt.0,True)

  plot = gsn_csm_contour_map(wks,invar,res)  

end
