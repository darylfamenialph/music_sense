
class BasePresenter<T>
{
  T view;

  void attachView(T view)
  {
    this.view = view;
  }

  void detachView()
  {
      this.view = null;
  }

  bool get isViewAttached
  {
    return view != null;
  }

  void checkViewAttached()
  {
    if(view == null){
      throw new Exception("Attached View is Null");
    }
  }

  T getView()
  {
    return view;
  }

}