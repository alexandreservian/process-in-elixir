defmodule ProcessInElixirTest.BookAgent do
  use ExUnit.Case, async: true
  doctest ProcessInElixir
  alias ProcessInElixir.BookAgent

  describe "BookAgent" do
    test "BookAgent.start_link: should return a pid" do
      {:ok, pid} = BookAgent.start_link
      assert is_pid(pid)
    end

    test "BookAgent.start_link(%{\"Dan Brown\": [\"Angels & Demons\"]}): should return using getAll method a map %{\"Dan Brown\": [\"Angels & Demons\"]}" do
      BookAgent.start_link %{"Dan Brown": ["Angels & Demons"]}
      assert BookAgent.getAll == %{"Dan Brown": ["Angels & Demons"]}
    end

    test "BookAgent.put(\"Dan Brown\", [\"Angels & Demons\"]): should return using get method a list [\"Angels & Demons\"]" do
      BookAgent.start_link
      BookAgent.put "Dan Brown", ["Angels & Demons"]
      assert BookAgent.get("Dan Brown") == ["Angels & Demons"]
    end

    test "BookAgent.put(example, [example]): should return using getAll method a map %{example}" do
      BookAgent.start_link
      BookAgent.put "Dan Brown", ["Angels & Demons","The Da Vinci Code"]
      BookAgent.put "Markus Zusak", ["The Book Thief"]
      assert BookAgent.getAll() == %{"Dan Brown"=> ["Angels & Demons","The Da Vinci Code"], "Markus Zusak"=> ["The Book Thief"]}
    end
  end
end
