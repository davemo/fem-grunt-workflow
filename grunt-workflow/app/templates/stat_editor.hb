<div class="wrapper">
  <div class="title-and-controls">
    <div class="title">{{ name }} - (rank <span class="rank">{{ rank }}</span>)</div>
    <div class="controls">
      <span class="done">Done Editing</span>
      <span class="reset">Reset to Minimums</span>
      <span class="total">
        <span class="allocated"></span>/<span class="max"></span>
      </span>
      <span id="rank-changer" class="rank{{ rank }}">
        <span class="ui-title">Rank</span>
        <span class="set-rank-1 change-rank">1</span><span class="set-rank-2 change-rank">2</span><span class="set-rank-3 change-rank">3</span>
      </span>
    </div>
  </div>

  <div class="portrait {{ name }}"></div>
  <ul class="stats"></ul>
</div>
