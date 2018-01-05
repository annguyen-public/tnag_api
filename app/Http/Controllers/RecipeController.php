<?php
 
namespace App\Http\Controllers;

use DB;
 
use Illuminate\Http\Request;
use App\Http\Requests;
use EllipseSynergie\ApiResponse\Contracts\Response;
use App\Recipe;
use App\Transformer\RecipeTransformer;


define("NEWEST_ROWS", 5);
 
class RecipeController extends Controller
{
    protected $respose;
 
    public function __construct(Response $response)
    {
        $this->response = $response;
    }
 
    public function index()
    {
        //Get all Recipes
        $recipes = Recipe::all();
        return response()->json($recipes, 200);
    }
 
    public function show($id)
    {
        //Get the recipe
        $recipe = Recipe::find($id);
        if (!$recipe) {
           return response()->json("", 404);
        }
        // Return a single recipe
        return response()->json($recipe, 200);
    }

    public function newest_recipes($offset)
    {
         //Get all Recipe
        $recipes = DB::table('recipes')
                ->join('users', 'users.id', '=', 'recipes.user_id')
                ->select('recipes.recipe_name', 'recipes.img_url', 'recipes.point', 'users.name')                
                ->orderByRaw('recipes.updated_at')
                ->skip($offset)->take(NEWEST_ROWS)
                ->get();
        // Return a collection of $recipe with pagination
        return response()->json($recipes, 200);
    } 
}