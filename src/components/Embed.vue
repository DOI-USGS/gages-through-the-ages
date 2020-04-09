<template>
  <div
    id="embedSection"
    class="section"
  >
    <div class="spacer">
      <h3>Copy below to embed figures</h3>
      <h4>Embed Description Area</h4>
      <div class="embedHolder">
        <div class="embed">
          <div class="socialMediaImage">
            <!-- Generator: Adobe Illustrator 21.0.2, SVG Export Plug-In . SVG Version: 6.00 Build 0)  -->
            <!-- DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"-->
            <svg
              id="Layer_1"
              version="1.1"
              xmlns="http://www.w3.org/2000/svg"
              xmlns:xlink="http://www.w3.org/1999/xlink"
              x="0px"
              y="0px"
              viewBox="0 0 25 25"
              style="enable-background:new 0 0 25 25;"
              xml:space="preserve"
            >
              <g>
                <polygon points="8.3,7.1 0,12 0,13 8.3,17.9 8.3,15.6 3,12.5 8.3,9.4 	" />
              </g>
              <g>
                <polygon points="16.8,17.9 25,13 25,12 16.8,7.1 16.8,9.4 22,12.5 16.8,15.6 	" />
              </g>
              <g>
                <polygon points="12.4,20 10.2,20 12.6,5 14.8,5 	" />
              </g>
            </svg>
          </div>
        </div>
        <input
          type="text"
          onclick="this.select();"
          value="<iframe src=&quot;urltosweetplace&quot;></iframe>"
          readonly="readonly"
        >
      </div>
    </div>
  </div>
</template>
<script>
export default {
    name: 'Embed'
}
</script>
<style scoped lang='scss'>
#embedSection{
  margin-top: 20px;
  background:rgb(225,225,225);
  border-radius:5px;
}

.spacer{
  padding:10px;
}

#embedSection h3,
#embedSection h4{
  font-weight:normal;
}

#embedSection h3{
  margin-bottom:15px;
}

#embedSection h4{
  margin-bottom:5px;
}

.embedHolder{
  display:flex;
  flex-direction:row;
}

.embed,
#embedSection input{
  border:1px solid rgb(150,150,150);
  background:#fff;
  height:30px;
  outline:none;
}

.embed{
  margin:0 -5px 0 0;
  border-radius:5px 0 0 5px;
  width:30px;
  position:relative;
  cursor:pointer;
}

.embed:hover{
  background:#ccc;
}

.embed .socialMediaImage{
  width:20px;
  height:20px;
  position:absolute;
  margin:auto;
  top:0; bottom:0; right:0; left:0;
}

#embedSection input{
  flex:1;
  padding:0 10px;
  border-radius:0 5px 5px  0;
}
</style>