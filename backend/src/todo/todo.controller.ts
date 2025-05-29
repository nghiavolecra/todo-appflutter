import { Controller, Get, Post, Body, Param, Put, Delete } from '@nestjs/common';
import { TodoService } from './todo.service';
import { Todo } from './schemas/todo.schema';

@Controller('todos')
export class TodoController {
    constructor(private readonly todoService: TodoService) { }

    @Get()
    async findAll(): Promise<Todo[]> {
        return this.todoService.findAll();
    }

    @Get(':id')
    async findOne(@Param('id') id: string): Promise<Todo | null> {
        return this.todoService.findOne(id);
    }

    @Post()
    async create(@Body() todo: Partial<Todo>): Promise<Todo> {
        return this.todoService.create(todo);
    }

    @Put(':id')
    async update(@Param('id') id: string, @Body() todo: Partial<Todo>): Promise<Todo | null> {
        return this.todoService.update(id, todo);
    }

    @Delete(':id')
    async delete(@Param('id') id: string): Promise<Todo | null> {
        return this.todoService.delete(id);
    }
}
