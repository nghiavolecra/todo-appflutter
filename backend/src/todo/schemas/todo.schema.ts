// todo.schema.ts
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { Document } from 'mongoose';

@Schema({ timestamps: true })
export class Todo extends Document {
    @Prop({ required: true }) title: string;
    @Prop() content: string;
    @Prop({ default: 'pending' }) status: string;
    @Prop() datetime: Date;
}

export const TodoSchema = SchemaFactory.createForClass(Todo);
