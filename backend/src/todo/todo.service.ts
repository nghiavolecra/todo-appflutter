import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Todo } from './schemas/todo.schema';
import { Model } from 'mongoose';

@Injectable()
export class TodoService {
    constructor(@InjectModel(Todo.name) private todoModel: Model<Todo>) { }

    async findAll(): Promise<Todo[]> {
        return this.todoModel.find().exec();
    }

    async findOne(id: string): Promise<Todo | null> {
        return this.todoModel.findById(id).exec();
    }

    async create(todo: Partial<Todo>): Promise<Todo> {
        const newTodo = new this.todoModel(todo);
        return newTodo.save();
    }

    async update(id: string, todo: Partial<Todo>): Promise<Todo | null> {
        return this.todoModel.findByIdAndUpdate(id, todo, { new: true }).exec();
    }

    async delete(id: string): Promise<Todo | null> {
        return this.todoModel.findByIdAndDelete(id).exec();
    }
}
