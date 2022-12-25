<?php

namespace App\Http\Controllers;

use App\Models\Blog;
use Illuminate\Http\Request;
use App\Http\Controllers\BaseController;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\Blog as BlogResource;

class BlogController extends BaseController
{
    //

    public function index()
    {
        $blogs = Blog::all();
        return $this->sendResponse(BlogResource::collection($blogs), 'Blogs retrieved successfully.');
    }

    public function store(Request $request)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'title' => 'required',
            'description' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $blog = Blog::create($input);
        return $this->sendResponse(new BlogResource($blog), 'Blog created successfully.');
    }

    public function show($id)
    {
        $blog = Blog::find($id);
        if (is_null($blog)) {
            return $this->sendError('Blog not found.');
        }
        return $this->sendResponse(new BlogResource($blog), 'Blog retrieved successfully.');
    }

    public function update(Request $request, Blog $blog)
    {
        $input = $request->all();
        $validator = Validator::make($input, [
            'title' => 'required',
            'description' => 'required',
        ]);
        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors());
        }
        $blog->title = $input['title'];
        $blog->description = $input['description'];
        $blog->save();
        return $this->sendResponse(new BlogResource($blog), 'Blog updated sucessfully.');
    }

    public function destroy(Blog $blog)
    {
        $blog->delete();
        return $this->sendResponse([], 'Blog deleted successfully.');
    }
}
