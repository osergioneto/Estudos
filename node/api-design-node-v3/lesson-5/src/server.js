import express from 'express'
import { json, urlencoded } from 'body-parser'
import morgan from 'morgan'
import config from './config'
import cors from 'cors'
import { connect } from './utils/db'
import userRouter from './resources/user/user.router'
import itemRouter from './resources/item/item.router'
import listRouter from './resources/list/list.router'
import { signup, signin, protect } from './utils/auth'

export const app = express()

app.disable('x-powered-by')

app.use(cors())
app.use(json())
app.use(urlencoded({ extended: true }))
app.use(morgan('dev'))

app.use('/api/user', protect, userRouter)
app.use('/api/item', protect, itemRouter)
app.use('/api/list', protect, listRouter)
app.post('/signup', async (req, res) => {
  try {
    const jwt = await signup(req, res)
    return res.status(201).json({ token: jwt })
  } catch (e) {
    console.log(e)
    return res.status(400).end()
  }
})
app.post('/signin', async (req, res) => {
  try {
    const jwt = await signin(req, res)
    return res.status(201).json({ token: jwt })
  } catch (e) {
    console.log(e)
    return res.status(400).end()
  }
})

export const start = async () => {
  try {
    await connect()
    app.listen(config.port, () => {
      console.log(`REST API on http://localhost:${config.port}/api`)
    })
  } catch (e) {
    console.error(e)
  }
}
