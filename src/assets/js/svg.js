var vizlab = vizlab || {};

(function() {
  "use strict";
  
  /*
   * Provides operations on the svg element parameter
   * @param {SVGSVGElement} svg
   * 
   */
  vizlab.svg = function(svg, options) {
    
    var cursorPoint = function(screenX, screenY) {
      var point = svg.createSVGPoint();
      point.x = screenX;
      point.y = screenY;
      point = point.matrixTransform(svg.getScreenCTM().inverse());
      point.x = Math.round(point.x);
      point.y = Math.round(point.y);
      return point;
    }
    
    var svgId = $(svg).attr("id");
    var tooltipGroupId = svgId + '-tooltip-group';
    
    var TOOLTIP_HTML = 
      '<defs>' + 
      '<clipPath id="' + svgId + '-tipClip">' +
      '<rect x="-6" y="-11.5" height="11" width="12"/>' +
      '</clipPath>' + 
      '</defs>' + 
      '<rect height="24" class="tooltip-box hidden"/>' +
      '<path d="M-6,-12 l6,10 l6,-10" class="tooltip-point hidden" clipPath="url(#'+ svgId + '-tipClip"/>' +
      '<text dy="-1.1em" text-anchor="middle" class="tooltip-text svg-text"> </text>';
    
    var addTooltip = function() {
      var tooltipGroup = document.createElementNS(svg.namespaceURI,"g");
      tooltipGroup.id = tooltipGroupId
      tooltipGroup.innerHTML = TOOLTIP_HTML;
      svg.appendChild(tooltipGroup);
    };
    /*
     * @param {Number} - DOM x coordinate where tooltip should be rendered
     * @param {Number} - DOM y coordinate where tooltip should be rendered
     * @param {String or Function} tooltipText - Returns text to appear in tooltip box. If tooltipText is a function,
          the function parameters will be evt, options.
     */
    var showTooltip = function(x, y, tooltipText) {
      var $tooltip = $(svg).find('.tooltip-text');
      var $tooltipBox = $(svg).find('.tooltip-box');
      var $tooltipPoint = $(svg).find('.tooltip-point');
      
      var text = (typeof tooltipText === "function") ? tooltipText(options) : tooltipText;
      var svgPoint = cursorPoint(x, y);
      var svgWidth = Number(svg.getAttribute("viewBox").split(" ")[2]);
      var textLength;
      var halfLength;
      var tooltipX;
      
      $tooltip.html(text);
      textLength = Math.round($tooltip.get()[0].getComputedTextLength());
      halfLength = textLength / 2;
      
      /* Make sure tooltip text is within the SVG */
      if (svgPoint.x - halfLength - 6 < 0)  {
        tooltipX = halfLength + 6;
      }
      else if (svgPoint.x + halfLength + 6 > svgWidth) {
        tooltipX = svgWidth - halfLength - 6;
      } 
      else {
        tooltipX = svgPoint.x;
      }
      $tooltip.attr("x", tooltipX).attr("y", svgPoint.y);
      
      /* Set attributes for background box */
     $tooltipBox.attr("x", tooltipX - halfLength - 6).attr("y", svgPoint.y - 35).attr("width", textLength + 12).removeClass("hidden");
      
      /* Set attributes for the tooltip point */
      $tooltipPoint.attr("transform", "translate(" + svgPoint.x + "," + svgPoint.y + ")").removeClass("hidden");
    };
    
    var hideTooltip = function() {
      $(svg).find('.tooltip-text').html("");
      $(svg).find('.tooltip-box').addClass("hidden");
      $(svg).find('.tooltip-point').addClass("hidden");
    };
  
    return {
      addTooltip: addTooltip,
      showTooltip : showTooltip,
      hideTooltip : hideTooltip
    };
  }
})();
