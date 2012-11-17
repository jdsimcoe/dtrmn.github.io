"use strict"
$(document).ready =>
  # logos
  Logos.ReferenceTagging.lbsBibleVersion = "KJV"
  Logos.ReferenceTagging.lbsLinksOpenNewWindow = true
  Logos.ReferenceTagging.lbsLogosLinkIcon = "dark"
  Logos.ReferenceTagging.lbsNoSearchTagNames = [ "cite", "h1", "h2", "h3", "h4", "h5", "h6" ]
  Logos.ReferenceTagging.lbsTargetSite = "biblia"
  Logos.ReferenceTagging.tag()
  Logos.ReferenceTagging.lbsCssOverride = true
  # masonry
  $('.note').masonry
      itemSelector: '.span6'
      columnWidth: 480
  return