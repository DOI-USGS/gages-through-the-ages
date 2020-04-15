<template>
  <div class="autocomplete">
    <input
      v-model="search"
      type="text"
      placeholder="city"
      @input="onChange"
      @keydown.down="onArrowDown"
      @keydown.up="onArrowUp"
      @keydown.enter="onEnter"
    >
    <ul
      v-show="isOpen"
      id="autocomplete-results"
      class="autocomplete-results"
    >
      <li
        v-for="(result, i) in results"
        :key="i"
        class="autocomplete-result"
        :class="{ 'is-active': i === arrowCounter }"
        @click="setResult(result)"
      >
        {{ result }}
      </li>
    </ul>
  </div>
</template>

<script>
    export default {
        name: "AutoCompleteSearchBox",
        props: {
            cityNames: {
                type: Array,
                required: false,
                default: () => []
            }
        },
        data() {
            return {
                isOpen: false,
                results: [],
                search: '',
                arrowCounter: -1
            };
        },
        methods: {
            mounted() {
                document.addEventListener('click', this.handleClickOutside);
            },
            destroyed() {
                document.removeEventListener('click', this.handleClickOutside);
            },
            onArrowDown() {
                if (this.arrowCounter < this.results.length) {
                    this.arrowCounter = this.arrowCounter + 1;
                }
            },
            onArrowUp() {
                if (this.arrowCounter > 0) {
                    this.arrowCounter = this.arrowCounter - 1;
                }
            },
            onEnter() {
                this.search = this.results[this.arrowCounter];
                this.isOpen = false;
                this.arrowCounter = -1;
            },
            setResult(result) {
                this.$emit('submit', result);
                this.search = result;
                this.isOpen = false;
            },
            onChange() {
                this.isOpen = true;
                this.filterResults();
            },
            filterResults() {
                this.results = this.cityNames.filter(item => item.toLowerCase().indexOf(this.search.toLowerCase()) > -1);
            },
            handleClickOutside(evt) {
                if (!this.$el.contains(evt.target)) {
                    this.isOpen = false;
                    this.arrowCounter = -1;
                }
            }
        }
    }
</script>

<style scoped lang="scss">
  .autocomplete {
    position: relative;
  }

  .autocomplete-results {
    padding: 0;
    margin: 0;
    border: 1px solid #eeeeee;
    height: 120px;
    overflow: auto;
    width: 100%;
  }

  .autocomplete-result {
    list-style: none;
    text-align: left;
    padding: 4px 2px;
    cursor: pointer;
  }

  .autocomplete-result.is-active,
  .autocomplete-result:hover {
    background-color: #4AAE9B;
    color: white;
  }
</style>
