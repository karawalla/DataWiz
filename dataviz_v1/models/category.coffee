global.Category = mongoose.model 'Category', new Schema
  id: ObjectId
  title:
    type: String
    validate:/.+/

  base:
    type: String

  created_at:
    type: Date
    default: Date.now

