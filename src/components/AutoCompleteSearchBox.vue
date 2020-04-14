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
        v-if="isLoading"
        class="loading"
      >
        Loading results...
      </li>
      <li
        v-for="(result, i) in results"
        v-else
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
            },
            isAsync: {
                type: Boolean,
                required: false,
                default: false,
            },
        },
        data() {
            return {
                isOpen: false,
                results: [],
                search: '',
                isLoading: false,
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
                this.$emit('input', this.search);
                this.search = result;
                this.isOpen = false;
            },
            onChange() {
                this.isOpen = true;
                this.filterResults();

                // Is the data given by an outside ajax request?
                if (this.isAsync) {
                    this.isLoading = true;
                } else {
                    // Data is sync, we can search our flat array
                    this.filterResults();
                    this.isOpen = true;
                }
            },
            filterResults() {
                this.results = this.cityNames.filter(item => item.toLowerCase().indexOf(this.search.toLowerCase()) > -1);
            },
            handleClickOutside(evt) {
                if (!this.$el.contains(evt.target)) {
                    this.isOpen = false;
                    this.arrowCounter = -1;
                }
            },
            watch: {
                // Once the items content changes, it means the parent component
                // provided the needed data
                items: function (value, oldValue) {
                    // we want to make sure we only do this when it's an async request
                    if (this.isAsync) {
                        this.results = value;
                        this.isOpen = true;
                        this.isLoading = false;
                    }
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
