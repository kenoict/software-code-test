import React from 'react'
import ReactDOM from 'react-dom'
import { Provider } from 'react-redux'
import { createStore, combineReducers } from 'redux'
import { rootChannels, channels, breadcrumbs } from './reducers'
import AppContainer from './containers/App'
import './index.css'


const channelsData = {
  '1': { id: '1', 'name': 'Animals', children: ['4', '5', '6']}
, '2': { id: '2', 'name': 'Sports', children: ['7', '8', '9']}
, '3': { id: '3', 'name': 'Beers', children: ['10', '11', '12']}
, '4': { id: '4', 'name': 'Bears', children: ['13', '14']}
, '5': { id: '5', 'name': 'Tigers'}
, '6': { id: '6', 'name': 'Snakes'}
, '7': { id: '7', 'name': 'Climbing'}
, '8': { id: '8', 'name': 'Skating'}
, '9': { id: '9', 'name': 'Mountianeering'}
, '10': { id: '10', 'name': 'Stout'}
, '11': { id: '11', 'name': 'Lager'}
, '12': { id: '12', 'name': 'Ale'}
, '13': { id: '13', 'name': 'Brown Bear'}
, '14': { id: '14', 'name': 'Black Bear'}
}
const rootChannelsData = [
  '1'
, '2'
, '3'
]
const breadcrumbsData = {}

const defaultData = {
  rootChannels: rootChannelsData
, channels: channelsData
, breadcrumbs: breadcrumbsData
}
const store = createStore(
  combineReducers({rootChannels, channels, breadcrumbs})
, defaultData
, window.devToolsExtension && window.devToolsExtension()
)

ReactDOM.render(
  <Provider store={store}>
     <AppContainer />
   </Provider>
, document.getElementById('root')
)
